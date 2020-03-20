//
//  AlimentoTableViewCell.swift
//  calc2.0
//
//  Created by Dara Vasconcelos on 17/03/20.
//  Copyright © 2020 Dara Vasconcelos. All rights reserved.
//

import UIKit

class AlimentoTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    //MARK: properties
    
    @IBOutlet weak var quantidadeTextField: UITextField!
    @IBOutlet weak var unidadeTextField: UITextField!
    @IBOutlet weak var nomeTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        quantidadeTextField.delegate = self
        unidadeTextField.delegate = self
        nomeTextField.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
