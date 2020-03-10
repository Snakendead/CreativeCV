//
//  WorkExperienceWorkExperiencePresenter.swift
//  CreativeCV
//
//  Created by Vladimir Vasilyev on 09/03/2020.
//  Copyright © 2020 Revolage. All rights reserved.
//

import Foundation

class WorkExperiencePresenter: NSObject, WorkExperienceViewOutput, WorkExperienceInteractorOutput {

    weak var collectionMediator: WorkExperienceCollectionMediator!
    weak var viewInput: WorkExperienceViewInput!

    var interactor: WorkExperienceInteractorInput!
    
    private var collectionData: [WorkExperienceModel] = [] {
        didSet {
            collectionMediator.dataCount = collectionData.count
        }
    }

    init(viewInput: WorkExperienceViewInput, collectionMediator: WorkExperienceCollectionMediator) {
        super.init()
        self.viewInput = viewInput
        self.interactor = WorkExperienceInteractor(output: self)
        self.collectionMediator = collectionMediator
        
        initialize()
        setupDependencies()
    }
    
    func initialize() {

    }

    func setupDependencies() {
        collectionMediator.fillCellData = {
            [weak self]
            (cellInput, indexPath) in
            guard let self_ = self else { return }
            let experience = self_.collectionData[indexPath.row]
            cellInput.updateInfo(experience.info)
            cellInput.updateRole(experience.role)
            cellInput.updateCompany(name: experience.companyName)
            cellInput.updateDate(start: experience.startTime, end: experience.endTime)
        }

        collectionMediator.dataCount = 0
    }

    //MARK: WorkExperienceInteractorOutput methods

    internal func dataDidLoad(_ models: [WorkExperienceModel]) {
        collectionData = models
    }
    
    //MARK: WorkExperienceViewOutput methods

    internal func viewIsReady() {
        interactor.loadData()
    }

    internal func viewWillAppear() {

    }

    //MARK:

}
