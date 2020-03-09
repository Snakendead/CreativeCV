//
//  EducationEducationViewController.swift
//  CreativeCV
//
//  Created by Vladimir Vasilyev on 09/03/2020.
//  Copyright © 2020 Revolage. All rights reserved.
//

import UIKit

class EducationViewController: BaseModuleViewController, EducationViewInput {

    var output: EducationViewOutput!
    var collectionMediator: EducationCollectionMediator!

    //MARK: Initialization
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.collectionMediator = EducationCollectionMediator()
        self.output = EducationPresenter(viewInput: self, collectionMediator: self.collectionMediator)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.collectionMediator = EducationCollectionMediator()
        self.output = EducationPresenter(viewInput: self, collectionMediator: self.collectionMediator)
    }

    override func setupDependencies() {
//        collectionMediator.fillCollection(collection)
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

    //MARK: EducationViewInput methods

}
