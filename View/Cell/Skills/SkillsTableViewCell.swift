//
//  SkillsTableViewCell.swift
//  CreativeCV
//
//  Created by Vladimir Vasilyev on 09/03/2020.
//  Copyright © 2020 Vladimir Vasilyev. All rights reserved.
//

import UIKit

class SkillsTableViewCell: UITableViewCell, SkillsCellViewInput {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var badgeView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        badgeView.layer.cornerRadius = 3

        let transform = CGAffineTransform(scaleX: 1.0, y: 3.0)
        progressView.transform = transform
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK:- Protocol methods
    
    func update(name: String) {
        nameLabel.text = name
    }
    
    func update(progress: Float) {
        progressView.setProgress(progress, animated: false)
    }

    func updateBadge(hidden: Bool) {
        badgeView.isHidden = hidden
    }
}
