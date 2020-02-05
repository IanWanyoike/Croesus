//
//  AnswerCell.swift
//  Croesus
//
//  Created by Ian Wanyoike on 03/02/2020.
//  Copyright © 2020 Pocket Pot. All rights reserved.
//

import UIKit
import RxSwift

class AnswerCell: UITableViewCell {

    @IBOutlet weak var labelWrapperView: UIView!
    @IBOutlet weak var labelView: UILabel!
    @IBOutlet weak var textFieldWrapperView: UIView!
    @IBOutlet weak var textField: UITextField!

    var viewModel: QuestionViewModel? {
        didSet {
            guard let viewModel = self.viewModel else { return }
            self.render(by: viewModel.type.value)
            self.setupBinding(with: viewModel)
        }
    }
    var optionIndex: Int?
    lazy var disposeBag = DisposeBag()

    private func render(by type: ControlType?) {
        switch type {
        case .radio:
            self.textFieldWrapperView.isHidden = true
            self.labelWrapperView.isHidden = false
            guard self.accessoryView == nil else { break }
            self.accessoryView = UIImageView(
                image: R.image.tick18()?.withRenderingMode(.alwaysTemplate)
            )
            self.accessoryView?.isHidden = true
        case .text:
            self.accessoryView = nil
            self.textFieldWrapperView.isHidden = false
            self.labelWrapperView.isHidden = true
        default:
            self.accessoryView = nil
        }
    }

    private func setupBinding(with viewModel: QuestionViewModel) {
        switch viewModel.type.value {
        case .text:
            self.textField.rx.text.bind(to: viewModel.answer).disposed(by: self.disposeBag)
        default:
            guard let optionIndex = self.optionIndex, optionIndex < viewModel.options.value.count else { break }
            self.labelView.text = viewModel.options.value[optionIndex]
            viewModel.selectedOptionIndex.bind { [weak self] index in
                self?.accessoryView?.isHidden = index != self?.optionIndex
            }.disposed(by: self.disposeBag)
        }
    }
}
