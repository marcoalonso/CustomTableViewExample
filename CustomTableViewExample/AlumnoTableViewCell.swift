//
//  AlumnoTableViewCell.swift
//  CustomTableViewExample
//
//  Created by marco alonso on 19/11/20.
//

import UIKit

class AlumnoTableViewCell: UITableViewCell {

    @IBOutlet weak var notaLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
