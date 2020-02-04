//
//  AnswerCell.swift
//  Croesus
//
//  Created by Ian Wanyoike on 03/02/2020.
//  Copyright © 2020 Pocket Pot. All rights reserved.
//

import UIKit

class AnswerCell: UITableViewCell {

    @IBOutlet weak var labelWrapperView: UIView!
    @IBOutlet weak var labelView: UILabel!
    @IBOutlet weak var textFieldWrapperView: UIView!
    @IBOutlet weak var textField: UITextField!
    
    var viewModel: QuestionViewModel?
    
}
