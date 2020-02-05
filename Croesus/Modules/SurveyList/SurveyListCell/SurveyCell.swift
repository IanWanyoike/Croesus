//
//  SurveyListCell.swift
//  Croesus
//
//  Created by Ian Wanyoike on 03/02/2020.
//  Copyright © 2020 Pocket Pot. All rights reserved.
//

import UIKit
import RxSwift

class SurveyCell: UITableViewCell {

    @IBOutlet weak private var iconImageView: UIImageView!
    @IBOutlet weak private var labelView: UILabel!

    var viewModel: SurveyViewModel? {
        didSet {
            guard let viewModel = self.viewModel else { return }
            self.setupUIDataBinding(viewModel: viewModel)
        }
    }
    lazy var disposeBag = DisposeBag()

    private func setupUIDataBinding(viewModel: SurveyViewModel) {
        viewModel.title.bind(to: self.labelView.rx.text).disposed(by: self.disposeBag)
    }
}
