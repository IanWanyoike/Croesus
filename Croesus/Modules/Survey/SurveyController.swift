//
//  SurveyController.swift
//  Croesus
//
//  Created by Ian Wanyoike on 02/02/2020.
//  Copyright © 2020 Pocket Pot. All rights reserved.
//

import UIKit
import RxSwift

class SurveyController: UITableViewController {

    let viewModel: SurveyViewModel
    let disposeBag: DisposeBag

    // MARK: - Initialisation
    init(viewModel: SurveyViewModel) {
        self.viewModel = viewModel
        self.disposeBag = DisposeBag()
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Survey"

        self.addNavButton(
            to: self.navigationItem,
            position: .left,
            selector: #selector(self.goBack),
            tintColor: .darkText,
            image: R.image.leftArrow18()
        )

        self.addNavButton(
            to: self.navigationItem,
            position: .right,
            selector: #selector(self.save),
            tintColor: .darkText,
            image: R.image.tick18()
        )

        self.tableView.separatorStyle = .none
        self.tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.tableView.rowHeight = UITableView.automaticDimension

        self.tableView.register(
            UINib(resource: R.nib.questionCell),
            forCellReuseIdentifier: R.nib.questionCell.identifier
        )
        self.tableView.register(
            UINib(resource: R.nib.answerCell),
            forCellReuseIdentifier: R.nib.answerCell.identifier
        )
    }

    @objc func goBack() {
        self.viewModel.cancel.onNext(())
    }

    @objc func save() {
        self.viewModel.onSave()
    }
}

// MARK: - Table view data source

extension SurveyController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel.questions.value.count
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 48))
        let label = UILabel(frame: CGRect(x: 24, y: 0, width: tableView.frame.width - 48, height: 48))
        label.font = R.font.quicksandSemiBold(size: 16)
        label.text = self.viewModel.questions.value[section].title.value
        view.addSubview(label)
        view.backgroundColor = UIColor.cellHeaderGray
        return view
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 48
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let viewModel = self.viewModel.questions.value[section]
        guard let type = viewModel.type.value else { return 1 }
        switch type {
        case .checkbox, .radio:
            return 1 + viewModel.options.value.count
        case .text:
            return 2
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = self.viewModel.questions.value[indexPath.section]
        var cell = UITableViewCell()
        switch indexPath.row {
        case 0:
            guard let questionCell = R.nib.questionCell(owner: tableView) else { break }
            questionCell.viewModel = viewModel
            cell = questionCell
        case 1..<self.tableView(tableView, numberOfRowsInSection: indexPath.section):
            guard let answerCell = R.nib.answerCell(owner: tableView) else { break }
            answerCell.optionIndex = indexPath.row - 1
            answerCell.viewModel = viewModel
            cell = answerCell
        default:
            cell = UITableViewCell()
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewModel = self.viewModel.questions.value[indexPath.section]
        guard viewModel.type.value != .some(.text) else { return }
        viewModel.selectedOptionIndex.accept(indexPath.row - 1)

    }
}
