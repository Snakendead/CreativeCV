//
//  EducationEducationInteractor.swift
//  CreativeCV
//
//  Created by Vladimir Vasilyev on 09/03/2020.
//  Copyright © 2020 Revolage. All rights reserved.
//

import Foundation

class EducationInteractor: NSObject, EducationInteractorInput {

    weak var output: EducationInteractorOutput!

    var serviceFacade: ServiceFacade = ServiceFacade.shared

    init(output: EducationInteractorOutput) {
        self.output = output
        super.init()
    }
}
