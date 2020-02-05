//
//  SurveyListController.swift
//  Croesus
//
//  Created by Ian Wanyoike on 05/02/2020.
//  Copyright © 2020 Pocket Pot. All rights reserved.
//

import UIKit
import RxSwift

class SurveyListController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private let refreshControl: UIRefreshControl

    let viewModel: SurveyListViewModel
    let disposeBag: DisposeBag

    // MARK: - Initialisation
    init(viewModel: SurveyListViewModel) {
        self.refreshControl = UIRefreshControl()
        self.viewModel = viewModel
        self.disposeBag = DisposeBag()
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Surveys"

        let navigationBar = self.navigationController?.navigationBar
        navigationBar?.titleTextAttributes = [
            .foregroundColor: UIColor.darkText,
            .font: R.font.quicksandBold(size: 18) ?? UIFont.preferredFont(forTextStyle: .title2)
        ]

        self.tableView.separatorStyle = .none
        self.tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.insertSubview(self.refreshControl, at: 0)

        self.tableView.register(R.nib.surveyCell)

        DispatchQueue.main.async {
            self.setupBinding()
            self.refreshControl.sendActions(for: .valueChanged)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }

    private func setupBinding() {
        self.viewModel.surveys
            .observeOn(MainScheduler.instance)
            .do(onNext: { [weak self] surveys in
                self?.refreshControl.endRefreshing()
                guard !surveys.isEmpty else { return }
                self?.tableView.separatorStyle = .singleLine
            })
            .bind(to: self.tableView.rx.items(cellIdentifier: R.nib.surveyCell.identifier, cellType: SurveyCell.self)) { _, viewModel, cell in
                cell.viewModel = viewModel
            }.disposed(by: self.disposeBag)

        self.refreshControl.rx.controlEvent(.valueChanged)
            .bind(to: self.viewModel.reload)
            .disposed(by: self.disposeBag)

        self.tableView.rx
            .modelSelected(SurveyViewModel.self)
            .bind(to: self.viewModel.selectSurvey)
            .disposed(by: self.disposeBag)
    }
}
