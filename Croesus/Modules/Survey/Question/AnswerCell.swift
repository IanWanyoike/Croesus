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
            self.setupBinding(with: viewModel)
            guard let type = viewModel.type.value else { return }
            self.render(by: type)
        }
    }
    var optionIndex: Int?
    lazy var disposeBag = DisposeBag()

    private func render(by type: ControlType) {
        switch type {
        case .radio:
            self.textFieldWrapperView.isHidden = true
            self.labelWrapperView.isHidden = false
        case .text:
            self.textFieldWrapperView.isHidden = false
            self.labelWrapperView.isHidden = true
        }
    }

    private func setupBinding(with viewModel: QuestionViewModel) {
        switch viewModel.type.value {
        case .text:
            self.textField.rx.text.bind(to: viewModel.answer).disposed(by: self.disposeBag)
        default:
            guard let index = self.optionIndex, index < viewModel.options.value.count else { break }
            self.labelView.text = viewModel.options.value[index]
            viewModel.selectedOptionIndex.bind { [weak self] index in
                guard index == self?.optionIndex else {
                    self?.accessoryType = .none
                    return
                }
                self?.accessoryType = .checkmark
            }.disposed(by: self.disposeBag)
        }
    }
}
