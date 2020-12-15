//
//  BodyEmailTableViewCell.swift
//  BodyEmail
//
//  Created by Jordi Milla on 15/12/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import UIKit

class BodyEmailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    var data: BodyEmail?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(bodyEmail: BodyEmail) {
        self.data = bodyEmail
        nameLabel.text = data?.name ?? ""
        emailLabel.text = data?.email ?? ""
        bodyLabel.text = data?.body ?? ""
    }
    
}
