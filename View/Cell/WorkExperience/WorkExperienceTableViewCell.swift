//
//  WorkExperienceTableViewCell.swift
//  CreativeCV
//
//  Created by Vladimir Vasilyev on 09/03/2020.
//  Copyright © 2020 Vladimir Vasilyev. All rights reserved.
//

import UIKit

class WorkExperienceTableViewCell: UITableViewCell, WorkExperienceCellViewInput {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateDate(start: String, end: String) {
        let dateTitle = "\(start)\n–\n\(end)"
        dateLabel.text = dateTitle
    }
    
    func updateCompany(name: String) {
        companyLabel.text = name
    }
    
    func updateRole(_ role: String) {
        roleLabel.text = role
    }
    
    func updateInfo(_ info: String) {
        infoLabel.text = info
    }
}
