//
//  WelcomeWelcomeViewController.swift
//  CreativeCV
//
//  Created by Vladimir Vasilyev on 09/03/2020.
//  Copyright © 2020 Revolage. All rights reserved.
//

import UIKit

class WelcomeViewController: BaseModuleViewController, WelcomeViewInput {

    var output: WelcomeViewOutput!

    //MARK: Initialization
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.output = WelcomePresenter(viewInput: self)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.output = WelcomePresenter(viewInput: self)
    }

    override func setupDependencies() {

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupActions()
        output.viewIsReady()
    }

    private func setupUI() {

    }

    private func setupActions() {

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output.viewWillAppear()
    }

    //MARK: WelcomeViewInput methods

}
