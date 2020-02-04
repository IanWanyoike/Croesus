//
//  PagesController.swift
//  Croesus
//
//  Created by Ian Wanyoike on 01/02/2020.
//  Copyright © 2020 Pocket Pot Limited. All rights reserved.
//

import UIKit

protocol FlowTriggerType where Self: UIViewController {
    var delegate: FlowDelegate? { get set }
}

protocol FlowDelegate: class {
    func previous()
    func next()
    func complete()
}

class PagesController<T>: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    // MARK: - State
    let viewModel: PagesViewModel<T>
    let pageViewController: UIPageViewController
    var currentIndex = 0
    var firstResponder: UITextField

    // MARK: - Initialisation
    init(viewModel: PagesViewModel<T>) {
        self.viewModel = viewModel
        self.pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal,
            options: nil
        )
        self.firstResponder = UITextField()
        self.firstResponder.isHidden = false
        super.init(nibName: nil, bundle: nil)
        self.viewModel.controllers.forEach { $0.delegate = self }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()

        self.setupPageController()
        self.addNavButton(
            to: self.navigationItem,
            position: .left,
            selector: #selector(self.goBack),
            tintColor: .darkText,
            image: R.image.leftArrow18()
        )
        self.view.addSubview(self.firstResponder)
        self.removeSwipeGesture()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }

    private func setupPageController() {
        self.pageViewController.delegate = self

        let initialController = self.viewControllerAtIndex(self.currentIndex)
        if let keyboardType = (initialController as? KeyboardAwareType)?.keyboardType {
            self.firstResponder.keyboardType = keyboardType
        }
        self.pageViewController.setViewControllers(
            [initialController].compactMap { $0 },
            direction: .forward,
            animated: true,
            completion: nil
        )

        self.pageViewController.dataSource = self

        self.addChild(self.pageViewController)
        self.view.addSubview(self.pageViewController.view)

        self.pageViewController.view.frame = self.view.bounds
        self.pageViewController.didMove(toParent: self)

        // Add the page view controller's gesture recognizers to the view controller's view so that the gestures are started more easily.
        self.view.gestureRecognizers = self.pageViewController.gestureRecognizers
    }

    // Disable Swipe to Scroll
    func removeSwipeGesture() {
        for view in self.pageViewController.view.subviews {
            guard let subView = view as? UIScrollView else { continue }
            subView.isScrollEnabled = false
        }
    }

    @objc func goBack() {
        guard !self.scrollToPreviousController() else { return }
        self.viewModel.cancel.onNext(())
    }

    // MARK: - UIPageViewController DataSource and Delegate

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController)
        guard index > 0, index != NSNotFound else {
            return nil
        }
        index -= 1
        return self.viewControllerAtIndex(index)
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController)
        guard index != NSNotFound else {
            return nil
        }
        index += 1
        guard index < self.viewModel.controllers.count else {
            return nil
        }
        return self.viewControllerAtIndex(index)
    }

    // MARK: - UIPageViewController Navigation
    /**
     Scrolls to the next view controller.
     */
    @discardableResult
    func scrollToNextController() -> Bool {
        guard let visibleController = self.viewControllerAtIndex(self.currentIndex), let nextController = self.pageViewController(self.pageViewController, viewControllerAfter: visibleController) else { return false }
        let keyboardType = (nextController as? KeyboardAwareType)?.keyboardType
        if keyboardType != nil { self.firstResponder.becomeFirstResponder() }
        self.scrollToController(controller: nextController) { _ in
            guard let type = keyboardType else { return }
            self.firstResponder.keyboardType = type
        }
        self.currentIndex += 1
        return true
    }

    /**
     Scrolls to the previous view controller.
     */
    @discardableResult
    @objc func scrollToPreviousController() -> Bool {
        guard let visibleController = self.viewControllerAtIndex(self.currentIndex), let previousController = self.pageViewController(self.pageViewController, viewControllerBefore: visibleController) else { return false }
        self.firstResponder.becomeFirstResponder()
        self.scrollToController(controller: previousController, direction: .reverse) { _ in
            guard let keyboardType = (previousController as? KeyboardAwareType)?.keyboardType else { return }
            self.firstResponder.keyboardType = keyboardType
        }
        self.currentIndex -= 1
        return true
    }

    /**
     Scrolls to the view controller at the given index. Automatically calculates
     the direction.

     - parameter newIndex: the new index to scroll to
     */
    func scrollToController(index newIndex: Int) {
        guard let newController = self.viewControllerAtIndex(newIndex) else { return }
        let direction: UIPageViewController.NavigationDirection = newIndex >= self.currentIndex ? .forward : .reverse
        self.scrollToController(controller: newController, direction: direction)
    }

    /**
     Scrolls to the given 'viewController' page.

     - parameter viewController: the view controller to show.
     */
    private func scrollToController(controller: UIViewController, direction: UIPageViewController.NavigationDirection = .forward, completion: ((Bool) -> Void)? = nil) {
        self.pageViewController.setViewControllers([controller], direction: direction, animated: true, completion: completion)
    }
}

// MARK: - Flow Delegate
extension PagesController: FlowDelegate {
    func previous() {
        self.scrollToPreviousController()
    }

    func next() {
        self.scrollToNextController()
    }

    func complete() {
        self.viewModel.onComplete()
    }
}

// MARK: - Helpers
extension PagesController {
    fileprivate func viewControllerAtIndex(_ index: Int) -> FlowTriggerType? {
        guard !self.viewModel.controllers.isEmpty || index < self.viewModel.controllers.count else { return nil }
        return self.viewModel.controllers[index]
    }

    fileprivate func indexOfViewController(_ viewController: UIViewController) -> Int {
        return self.viewModel.controllers.firstIndex(where: { viewController === $0 }) ?? NSNotFound
    }
}
