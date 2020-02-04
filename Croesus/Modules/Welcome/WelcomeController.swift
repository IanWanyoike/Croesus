//
//  WelcomeController.swift
//  Croesus
//
//  Created by Ian Wanyoike on 02/02/2020.
//  Copyright © 2020 Pocket Pot. All rights reserved.
//

import UIKit
import RxSwift

class WelcomeController: UIViewController {

    // MARK: - UI Outlets
    @IBOutlet weak var getStartedButton: UIButton!

    // MARK: - State
    let viewModel: WelcomeViewModel
    let disposeBag: DisposeBag

    // MARK: - Initialisation
    init(viewModel: WelcomeViewModel) {
        self.viewModel = viewModel
        self.disposeBag = DisposeBag()
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUIDataBinding()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }

    private func setupUIDataBinding() {
        self.getStartedButton.rx.tap
            .bind(to: self.viewModel.authenticate)
            .disposed(by: self.disposeBag)
    }
}
