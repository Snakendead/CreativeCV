//
//  WorkExperienceWorkExperienceViewController.swift
//  CreativeCV
//
//  Created by Vladimir Vasilyev on 09/03/2020.
//  Copyright © 2020 Revolage. All rights reserved.
//

import UIKit

class WorkExperienceViewController: BaseModuleViewController, WorkExperienceViewInput {

    var output: WorkExperienceViewOutput!
    var collectionMediator: WorkExperienceCollectionMediator!

    //MARK: Initialization
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.collectionMediator = WorkExperienceCollectionMediator()
        self.output = WorkExperiencePresenter(viewInput: self, collectionMediator: self.collectionMediator)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.collectionMediator = WorkExperienceCollectionMediator()
        self.output = WorkExperiencePresenter(viewInput: self, collectionMediator: self.collectionMediator)
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

    //MARK: WorkExperienceViewInput methods

}