//
//  InfoModel.swift
//  CreativeCV
//
//  Created by Vladimir Vasilyev on 09/03/2020.
//  Copyright © 2020 Vladimir Vasilyev. All rights reserved.
//

import UIKit

class InfoModel: NSObject {

    let name: String
    let surname: String
    
    let phone: String
    
    let locationLatitude: Double
    let locationLongitude: Double
    
    init(with name: String,
         surname: String,
         phone: String,
         locationLatitude: Double,
         locationLongitude: Double) {

        self.name = name
        self.surname = surname
        self.phone = phone
        self.locationLatitude = locationLatitude
        self.locationLongitude = locationLongitude
    }
}
