//
//  WorkExperienceWorkExperienceInteractor.swift
//  CreativeCV
//
//  Created by Vladimir Vasilyev on 09/03/2020.
//  Copyright © 2020 Revolage. All rights reserved.
//

import Foundation

class WorkExperienceInteractor: NSObject, WorkExperienceInteractorInput {

    weak var output: WorkExperienceInteractorOutput!

    var serviceFacade: ServiceFacade = ServiceFacade.shared

    init(output: WorkExperienceInteractorOutput) {
        self.output = output
        super.init()
    }
    
    func loadData() {
        let models = serviceFacade.databaseManager.getWorks()
        output.dataDidLoad(models)
    }
}
