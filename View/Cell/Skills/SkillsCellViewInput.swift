//
//  SkillsCellViewInput.swift
//  CreativeCV
//
//  Created by Vladimir Vasilyev on 09/03/2020.
//  Copyright © 2020 Vladimir Vasilyev. All rights reserved.
//

import UIKit

protocol SkillsCellViewInput: UITableViewCell {
    
    func update(name: String)
    func update(progress: Float)
    func updateBadge(hidden: Bool)

}
