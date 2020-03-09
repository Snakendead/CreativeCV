//
//  WelcomeWelcomeInteractor.swift
//  CreativeCV
//
//  Created by Vladimir Vasilyev on 09/03/2020.
//  Copyright © 2020 Revolage. All rights reserved.
//

import Foundation

class WelcomeInteractor: NSObject, WelcomeInteractorInput {

    weak var output: WelcomeInteractorOutput!

    var serviceFacade: ServiceFacade = ServiceFacade.shared

    init(output: WelcomeInteractorOutput) {
        self.output = output
        super.init()
    }
}
