//
//  WorkExperienceCellViewInput.swift
//  CreativeCV
//
//  Created by Vladimir Vasilyev on 09/03/2020.
//  Copyright © 2020 Vladimir Vasilyev. All rights reserved.
//

import UIKit

protocol WorkExperienceCellViewInput: UITableViewCell {
    
    func updateDate(start: String, end: String)
    func updateCompany(name: String)
    func updateRole(_ role: String)
    func updateInfo(_ info: String)
}
