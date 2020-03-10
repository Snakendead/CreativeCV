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
    
    @IBOutlet weak var downloadButton: UIButton!
    
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
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        photoImageView.layer.cornerRadius = 10.0
        photoImageView.alpha = 0.0
    }

    private func setupActions() {

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output.viewWillAppear()
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    //MARK: WelcomeViewInput methods

    func showName(_ name: String) {
        
        var characterArray = [Character]()
        for character in name {
            characterArray.append(character)
        }

        guard characterArray.count > 0 else { return }
        
        var index = 0

        printEffectTimer = Timer.scheduledTimer(withTimeInterval: 0.1,
                                                repeats: true,
                                                block: { [weak self] (timer) in
                                                    guard let self_ = self else { return }
                                                    self_.nameTextView.text.append(characterArray[index])
                                                    index += 1
                                                    if index == characterArray.count {
                                                        timer.invalidate()
                                                    }
        })
    }
    
    func showPage() {
        activityIndicator.stopAnimating()
                
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
                        self.photoImageView.alpha = 1.0
        }) { (_) in
            
        }
        
    }
    
    func showLoadingError(_ text: String) {
        showSimpleAlert(with: nil, message: text)
    }
    
    func openPhoneURL(_ number: URL) {
        if UIApplication.shared.canOpenURL(number) {
            UIApplication.shared.open(number)
        }
        else {
            showSimpleAlert(with: "Warning", message: "This device can't open phone url \(number.absoluteString)")
        }
    }
    
    func openMapsURL(_ url: URL) {
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
        else {
            showSimpleAlert(with: "Warning", message: "This device can't open maps url \(url.absoluteString)")
        }
    }
    
    func openEmailURL(_ url: URL) {
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
        else {
            showSimpleAlert(with: "Warning", message: "This device can't open email url \(url.absoluteString)")
        }
    }
    
    func enableDownloadButton() {
        downloadButton.isEnabled = true
    }
    
    func disableDownloadButton() {
        downloadButton.isEnabled = false
    }
    
    func hideDownloadButton() {
        downloadButton.isHidden = true
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
        
    @IBAction func downloadButtonAction(_ sender: UIButton) {
        activityIndicator.startAnimating()
        output.downloadDidTapped()
    }
    
    //MARK: private
    
    func showSimpleAlert(with title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let cancelAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
}
