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

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var nameTextView: UITextView!
    
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var emailButton: UIButton!
    @IBOutlet weak var locationButton: UIButton!
    
    @IBOutlet weak var skillsButton: UIButton!
    @IBOutlet weak var experienceButton: UIButton!
    
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

    //MARK: Actions
    
    @IBAction func callButtonAction(_ sender: UIButton) {
        
    }
    
    @IBAction func emailButtonAction(_ sender: UIButton) {
        
    }
    
    @IBAction func locationButtonAction(_ sender: UIButton) {
        ServiceFacade.shared.databaseManager.downloadDatabaseFile(with: {
            
        }) { (error) in
            
        }
    }
        
}
