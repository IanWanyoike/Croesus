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
import Photos

class AvatarController: UIViewController, FlowTriggerType {

    // MARK: - UI Outlets
    @IBOutlet weak var selfieImageView: UIImageView!
    @IBOutlet weak var selfieButton: UIButton! {
        didSet {
            self.selfieButton.setImage(
                self.selfieButton.image(for: .normal)?.withRenderingMode(.alwaysTemplate),
                for: .normal)
        }
    }
    @IBOutlet weak var saveButton: UIButton! {
        didSet {
            self.saveButton.setImage(
                self.saveButton.image(for: .normal)?.withRenderingMode(.alwaysTemplate),
                for: .normal)
        }
    }

    // MARK: - State
    let viewModel: AvatarViewModel
    weak var delegate: FlowDelegate?
    var keyboardType: UIKeyboardType
    let imagePicker: UIImagePickerController
    let disposeBag: DisposeBag

    // MARK: - Initialisation
    init(viewModel: AvatarViewModel) {
        self.viewModel = viewModel
        self.keyboardType = .default
        self.imagePicker = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            self.imagePicker.sourceType = .camera
            self.imagePicker.cameraDevice = .front
        }
        self.disposeBag = DisposeBag()
        super.init(nibName: nil, bundle: nil)
        self.imagePicker.delegate = self
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUIDataBinding()
    }

    private func setupUIDataBinding() {
        self.viewModel.avatar
            .bind(to: self.selfieImageView.rx.image)
            .disposed(by: self.disposeBag)
    }

    @IBAction func takePhoto(_ sender: UIButton) {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            let alert = UIAlertController(
                title: "Camera Unavailable",
                message: "The app is not able to access the camera. Please ensure you're running the app on a device, not a simulator.",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
            self.present(alert, animated: true)
            return
        }
        switch AVCaptureDevice.authorizationStatus(for: AVMediaType.video) {
        case .authorized, .notDetermined:
            self.imagePicker.sourceType = .camera
            self.imagePicker.allowsEditing = true
            self.present(self.imagePicker, animated: true, completion: nil)
        default:
            let alert = UIAlertController(
                title: "Grant Camera Access?",
                message: "\(Constants.bundleName) needs access to your camera to enable you to take a selfie to save as your avatar.",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            alert.addAction(UIAlertAction(title: "Grant", style: .default) { _ in
                guard let settingsUrl = URL(string: UIApplication.openSettingsURLString), UIApplication.shared.canOpenURL(settingsUrl) else { return }
                UIApplication.shared.open(settingsUrl, completionHandler: nil)
            })
            self.present(alert, animated: true)
        }
    }

    @IBAction func save(_ sender: UIButton) {
        guard self.viewModel.avatar.value != nil else {
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.error)
            self.selfieImageView.backgroundColor = UIColor.redDamask.withAlphaComponent(0.15)
            delay(0.3) {
                self.selfieImageView.backgroundColor = UIColor.black.withAlphaComponent(0.15)
            }
            self.selfieImageView.shake()
            return
        }
        self.delegate?.complete()
    }
}

// MARK: - IMAGE PICKER DELEGATE
extension AvatarController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        DispatchQueue.main.async { picker.dismiss(animated: true, completion: nil) }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let image = info[.originalImage] as? UIImage else {
            DispatchQueue.main.async { picker.dismiss(animated: true, completion: nil) }
            return
        }
        DispatchQueue.global(qos: .background).async {
            let image = image.faceUp()
            DispatchQueue.main.async {
                self.viewModel.avatar.accept(image)
                picker.dismiss(animated: true, completion: nil)
            }
        }
    }
}
