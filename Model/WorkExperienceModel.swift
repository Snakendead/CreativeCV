//
//  WorkExperienceModel.swift
//  CreativeCV
//
//  Created by Vladimir Vasilyev on 09/03/2020.
//  Copyright © 2020 Vladimir Vasilyev. All rights reserved.
//

import UIKit

class WorkExperienceModel: NSObject {

    let companyName: String
    let role: String
    
    let info: String
    
    let startTime: String
    let endTime: String
    
    init(with companyName: String,
         role: String,
         info: String,
         startTime: String,
         endTime: String) {
        
        self.companyName = companyName
        self.role = role
        self.info = info
        self.startTime = startTime
        self.endTime = endTime
    }
}
