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
    
    internal func dataDidLoad() {
        DispatchQueue.main.async {
            self.viewInput.showPage()
        }
    }
    
    //MARK: WelcomeViewOutput methods

    internal func viewIsReady() {
        interactor.loadData()
    }

    internal func viewWillAppear() {

    }

    //MARK: Actions
    
    func callDidTapped() {
        
    }
    
    func locationDidTapped() {
        
    }
    
    func emailDidTapped() {
        
    }

}
