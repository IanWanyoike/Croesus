//
//  SurveyListController.swift
//  Croesus
//
//  Created by Ian Wanyoike on 02/02/2020.
//  Copyright © 2020 Pocket Pot. All rights reserved.
//

import UIKit
import RxSwift

class SurveyListController: UITableViewController {

    private var indicator: UIActivityIndicatorView

    let viewModel: SurveyListViewModel
    let disposeBag: DisposeBag

    // MARK: - Initialisation
    init(viewModel: SurveyListViewModel) {
        self.indicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        self.indicator.style = .gray
        self.indicator.hidesWhenStopped = true

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
        self.navigationItem.largeTitleDisplayMode = .automatic

        let navigationBar = self.navigationController?.navigationBar
        navigationBar?.titleTextAttributes = [
            .foregroundColor: UIColor.darkText,
            .font: R.font.quicksandBold(size: 18) ?? UIFont.preferredFont(forTextStyle: .title2)
        ]

        self.tableView.separatorStyle = .none
        self.tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.tableView.rowHeight = UITableView.automaticDimension
        
        self.tableView.register(
            UINib(resource: R.nib.surveyCell),
            forCellReuseIdentifier: R.nib.surveyCell.identifier
        )

        self.indicator.center = CGPoint(x: self.view.frame.width / 2, y: 64)
        self.view.addSubview(self.indicator)

        self.indicator.startAnimating()
        self.viewModel.load().subscribe { [weak self] _ in
            self?.indicator.stopAnimating()
            self?.tableView.separatorStyle = .singleLine
            self?.tableView.reloadData()
        }.disposed(by: self.disposeBag)
    }
}

// MARK: - Table view data source

extension SurveyListController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.surveys.value.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = R.nib.surveyCell(owner: tableView) else { return UITableViewCell() }
        cell.viewModel = self.viewModel.surveys.value[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel.selectSurvey.onNext(self.viewModel.surveys.value[indexPath.row])
    }
}
