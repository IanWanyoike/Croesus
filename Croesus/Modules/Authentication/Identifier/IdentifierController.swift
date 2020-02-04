//
//  NameController.swift
//  Croesus
//
//  Created by Ian Wanyoike on 01/02/2020.
//  Copyright © 2020 Pocket Pot Limited. All rights reserved.
//

import UIKit
import RxSwift

class IdentifierController: UIViewController, KeyboardAwareType, FlowTriggerType {

    // MARK: - UI Outlets
    @IBOutlet weak var identifierFieldWrapper: UIView!
    @IBOutlet weak var identifierTextField: UITextField! {
        didSet {
            self.keyboardType = self.identifierTextField.keyboardType
        }
    }
    @IBOutlet weak var nextButton: UIButton! {
        didSet {
            self.nextButton.setImage(
                self.nextButton.image(for: .normal)?.withRenderingMode(.alwaysTemplate),
                for: .normal
            )
        }
    }

    // MARK: - State
    let viewModel: IdentifierViewModel
    weak var delegate: FlowDelegate?
    var keyboardType: UIKeyboardType
    let disposeBag: DisposeBag

    // MARK: - Initialisation
    init(viewModel: IdentifierViewModel) {
        self.viewModel = viewModel
        self.keyboardType = .default
        self.disposeBag = DisposeBag()
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.identifierFieldWrapper.setBorder(
            radius: 8.0,
            width: 1.5,
            color: UIColor.black.withAlphaComponent(0.15)
        )        
        self.switchKeyboardAware(to: true)
        self.setupUIDataBinding()
    }

    private func setupUIDataBinding() {
        self.identifierTextField.rx.text
            .bind(to: self.viewModel.identifier)
            .disposed(by: self.disposeBag)
    }

    @IBAction func next(_ sender: UIButton) {
        guard !self.viewModel.identifier.value.nilOrEmpty() else {
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.error)
            self.identifierFieldWrapper.setBorder(
                radius: 8.0,
                width: 1.5,
                color: UIColor.redDamask.withAlphaComponent(0.6)
            )
            delay(0.3) {
                self.identifierFieldWrapper.setBorder(
                    radius: 8.0,
                    width: 1.5,
                    color: UIColor.black.withAlphaComponent(0.15)
                )
            }
            self.identifierFieldWrapper.shake()
            return
        }
        self.delegate?.next()
    }

    // MARK: - Keyboard Aware Type Conformance

    @IBOutlet weak var keyboardAwareConstraint: NSLayoutConstraint?

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        delay(0.1) { self.identifierTextField.becomeFirstResponder() }
    }

    @objc func keyboardNotification(notification: NSNotification) {
        self.keyboardAware(notification: notification)
    }

    deinit { self.switchKeyboardAware(to: false) }
}
