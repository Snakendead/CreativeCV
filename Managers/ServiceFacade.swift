//
//  ServiceFacade.swift
//  CreativeCV
//
//  Created by Vladimir Vasilyev on 09/03/2020.
//  Copyright © 2020 Vladimir Vasilyev. All rights reserved.
//

import UIKit

class ServiceFacade: NSObject {

    static let shared = ServiceFacade()
    
    let databaseManager = DatabaseManager()
}
