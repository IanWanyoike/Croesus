//
//  NameController.swift
//  Croesus
//
//  Created by Ian Wanyoike on 01/02/2020.
//  Copyright © 2020 Pocket Pot Limited. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class NameController: UIViewController, KeyboardAwareType, FlowTriggerType {

    // MARK: - UI Outlets
    @IBOutlet weak private var nameFieldWrapper: UIView!
    @IBOutlet weak private var firstNameTextField: UITextField! {
        didSet {
            self.keyboardType = self.firstNameTextField.keyboardType
        }
    }
    @IBOutlet weak private var lastNameTextField: UITextField!
    @IBOutlet weak private var buttonGroupHeightConstraint: NSLayoutConstraint!

    @IBOutlet weak private var nextButton: UIButton! {
        didSet {
            self.nextButton.setImage(
                self.nextButton.image(for: .normal)?.withRenderingMode(.alwaysTemplate),
                for: .normal
            )
        }
    }
    
    // MARK: - State
    let viewModel: NameViewModel
    weak var delegate: FlowDelegate?
    var keyboardType: UIKeyboardType
    let disposeBag: DisposeBag

    // MARK: - Initialisation
    init(viewModel: NameViewModel) {
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
        self.nameFieldWrapper.setBorder(
            radius: 8.0,
            width: 1.5,
            color: UIColor.black.withAlphaComponent(0.15)
        )
        self.firstNameTextField.delegate = self
        self.lastNameTextField.delegate = self
        self.switchKeyboardAware(to: true)
        self.setupUIDataBinding()
    }

    private func setupUIDataBinding() {
        Disposables.create([
            self.firstNameTextField.rx.text.bind(to: self.viewModel.firstName),
            self.lastNameTextField.rx.text.bind(to: self.viewModel.lastName)
        ]).disposed(by: self.disposeBag)
    }

    @IBAction private func next(_ sender: UIButton) {
        guard !self.viewModel.firstName.value.nilOrEmpty(), !self.viewModel.lastName.value.nilOrEmpty() else {
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.error)
            self.nameFieldWrapper.setBorder(
                radius: 8.0,
                width: 1.5,
                color: UIColor.redDamask.withAlphaComponent(0.6)
            )
            delay(0.3) {
                self.nameFieldWrapper.setBorder(
                    radius: 8.0,
                    width: 1.5,
                    color: UIColor.black.withAlphaComponent(0.15)
                )
            }
            self.nameFieldWrapper.shake()
            return
        }
        self.delegate?.next()
    }

    // MARK: - Keyboard Aware Type Conformance

    @IBOutlet weak var keyboardAwareConstraint: NSLayoutConstraint?

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        delay(0.6) { self.firstNameTextField.becomeFirstResponder() }
    }

    @objc func keyboardNotification(notification: NSNotification) {
        self.keyboardAware(notification: notification)
    }

    deinit { self.switchKeyboardAware(to: false) }
}

extension NameController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case self.firstNameTextField:
            self.lastNameTextField.becomeFirstResponder()
            return true
        case self.lastNameTextField:
            self.next(self.nextButton)
        default:
            break
        }
        return false
    }
}
