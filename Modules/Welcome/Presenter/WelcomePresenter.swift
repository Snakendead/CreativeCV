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
    
    private var info: InfoModel? = nil

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
    
    internal func dataDidLoad(info: InfoModel) {
        self.info = info
        DispatchQueue.main.async {
            self.viewInput.showPage()
            self.viewInput.hideDownloadButton()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.viewInput.showName(info.name + " " + info.surname)
        }
    }
    
    func dataLoadFailed(_ reason: String) {
        DispatchQueue.main.async {
            self.viewInput.showLoadingError(reason)
            self.viewInput.enableDownloadButton()
        }
    }

    //MARK: WelcomeViewOutput methods

    internal func viewIsReady() {
        
    }

    internal func viewWillAppear() {

    }

    //MARK: Actions
    
    func callDidTapped() {
        guard let info_ = info else { return }
        let phone = info_.phone
        guard let number = URL(string: "tel://" + phone) else { return }
        viewInput.openPhoneURL(number)
    }
    
    func locationDidTapped() {
        guard let info_ = info else { return }
        let lat = info_.locationLatitude
        let lon = info_.locationLongitude

        guard let url = URL.init(string: "https://www.google.com/maps/search/?api=1&query=\(lat),\(lon)") else {
            return
        }
        
        viewInput.openMapsURL(url)
    }
    
    func emailDidTapped() {
        guard let info_ = info else { return }
        let mail = info_.mail
        guard let url = URL(string: "mailto:\(mail)") else {
          return
        }

        viewInput.openEmailURL(url)
    }

    func downloadDidTapped() {
        interactor.loadData()
        viewInput.disableDownloadButton()
    }
}
