//
//  SkillModel.swift
//  CreativeCV
//
//  Created by Vladimir Vasilyev on 09/03/2020.
//  Copyright © 2020 Vladimir Vasilyev. All rights reserved.
//

import UIKit

class SkillModel: NSObject {

    let name: String
    let grade: Int
    let info: String
    
    init(with name: String,
         grade: Int,
         info: String)
    {
        self.name = name
        self.grade = grade
        self.info = info
    }
    
}
