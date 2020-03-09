//
//  SkillsSkillsInteractor.swift
//  CreativeCV
//
//  Created by Vladimir Vasilyev on 09/03/2020.
//  Copyright © 2020 Revolage. All rights reserved.
//

import Foundation

class SkillsInteractor: NSObject, SkillsInteractorInput {

    weak var output: SkillsInteractorOutput!

    var serviceFacade: ServiceFacade = ServiceFacade.shared

    init(output: SkillsInteractorOutput) {
        self.output = output
        super.init()
    }
}
