//
//  WelcomeWelcomeViewInput.swift
//  CreativeCV
//
//  Created by Vladimir Vasilyev on 09/03/2020.
//  Copyright © 2020 Revolage. All rights reserved.
//

import Foundation

protocol WelcomeViewInput: class {

    func showPage()
    func showLoadingError()
    
    func openPhoneURL(_ number: URL)
    func openMapsURL(_ url: URL)
    func openEmailURL(_ url: URL)
}
