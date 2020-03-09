//
//  WelcomeWelcomePresenter.swift
//  CreativeCV
//
//  Created by Vladimir Vasilyev on 09/03/2020.
//  Copyright © 2020 Revolage. All rights reserved.
//

import Foundation

class WelcomePresenter: NSObject, WelcomeViewOutput, WelcomeInteractorOutput {

    weak var viewInput: WelcomeViewInput!

    var interactor: WelcomeInteractorInput!

    init(viewInput: WelcomeViewInput) {
        super.init()
        self.viewInput = viewInput
        self.interactor = WelcomeInteractor(output: self)

        initialize()
        setupDependencies()
    }

    func initialize() {

    }

    func setupDependencies() {

    }

    //MARK: WelcomeInteractorOutput methods

    internal func viewIsReady() {

    }

    internal func viewWillAppear() {

    }

    //MARK:

    internal func getViewLayer() -> Any {
        return viewInput
    }
}
