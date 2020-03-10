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
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private var printEffectTimer: Timer? = nil
    
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
        photoImageView.layer.cornerRadius = 10.0
        
        activityIndicator.startAnimating()
        photoTopConstraint.constant = -300
        UIView.performWithoutAnimation {
            self.view.layoutIfNeeded()
        }
    }

    private func setupActions() {

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output.viewWillAppear()
    }

    //MARK: WelcomeViewInput methods

    func showPage() {
        activityIndicator.stopAnimating()
        
        photoTopConstraint.constant = 20
        
        self.callButton.isHidden = false
        self.emailButton.isHidden = false
        self.locationButton.isHidden = false
        self.skillsButton.isHidden = false
        self.experienceButton.isHidden = false

        UIView.animate(withDuration: 1.0,
                       delay: 0.0,
                       options: UIView.AnimationOptions.curveEaseInOut,
                       animations: {
                        self.callButton.alpha = 1.0
                        self.emailButton.alpha = 1.0
                        self.locationButton.alpha = 1.0
                        self.skillsButton.alpha = 1.0
                        self.experienceButton.alpha = 1.0
                        
                        self.view.layoutIfNeeded()
        }) { (_) in
            
        }
        
    }
    
    func showLoadingError() {
        
    }
    
    func openPhoneURL(_ number: URL) {
        UIApplication.shared.open(number)
    }
    
    func openMapsURL(_ url: URL) {
        UIApplication.shared.open(url)
    }
    
    func openEmailURL(_ url: URL) {
        UIApplication.shared.open(url)
    }

    //MARK: Actions
    
    @IBAction func callButtonAction(_ sender: UIButton) {
        output.callDidTapped()
    }
    
    @IBAction func emailButtonAction(_ sender: UIButton) {
        output.emailDidTapped()
    }
    
    @IBAction func locationButtonAction(_ sender: UIButton) {
        output.locationDidTapped()
    }
        
}
