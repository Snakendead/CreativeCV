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
    
    func loadData() {
        serviceFacade.databaseManager.downloadDatabaseFile(with: {
            [weak self] in
            guard let self_ = self else { return }
            guard let info = self_.serviceFacade.databaseManager.getInfo() else {
                self_.output.dataLoadFailed("Info model ot loaded")
                return
            }
            self_.output.dataDidLoad(info: info)
        }) { [weak self]
            (error) in
            guard let self_ = self else { return }
            self_.output.dataLoadFailed("Data not loaded")
        }
    }
}
