//
//  QuestionCell.swift
//  Croesus
//
//  Created by Ian Wanyoike on 03/02/2020.
//  Copyright © 2020 Pocket Pot. All rights reserved.
//

import UIKit
import RxSwift

class QuestionCell: UITableViewCell {

    @IBOutlet weak var labelView: UILabel!

    var viewModel: QuestionViewModel? {
        didSet {
            guard let viewModel = self.viewModel else { return }
            self.setBinding(with: viewModel)
        }
    }
    lazy var disposeBag = DisposeBag()

    private func setBinding(with viewModel: QuestionViewModel) {
        viewModel.label
            .bind(to: self.labelView.rx.text)
            .disposed(by: self.disposeBag)
    }
}
