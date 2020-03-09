//
//  SkillsSkillsPresenter.swift
//  CreativeCV
//
//  Created by Vladimir Vasilyev on 09/03/2020.
//  Copyright © 2020 Revolage. All rights reserved.
//

import Foundation

class SkillsPresenter: NSObject, SkillsViewOutput, SkillsInteractorOutput {

    weak var collectionMediator: SkillsCollectionMediator!
    weak var viewInput: SkillsViewInput!
    
    var interactor: SkillsInteractorInput!
    
    private var badgeHidden: [Int: Bool] = [:]
    private var collectionData: [SkillModel] = [] {
        didSet (value) {
            collectionMediator.dataCount = collectionData.count
        }
    }

    init(viewInput: SkillsViewInput, collectionMediator: SkillsCollectionMediator) {
        super.init()
        self.viewInput = viewInput
        self.interactor = SkillsInteractor(output: self)
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
            let skill = self_.collectionData[indexPath.row]
            cellInput.update(name: skill.name)
            
            let progress: Float = Float(skill.grade) / 10.0
            cellInput.update(progress: progress)
            
            if self_.badgeHidden[indexPath.row] ?? false {
                cellInput.updateBadge(hidden: true)
            }
        }

        collectionMediator.cellSelectionClosure = {
            [weak self]
            (cellInput, indexPath) in
            guard let self_ = self else { return }
            _ = self_.collectionData[indexPath.row]
            self_.badgeHidden[indexPath.row] = true
            
            cellInput.updateBadge(hidden: true)

        }

        collectionMediator.dataCount = 0
    }

    //MARK: SkillsInteractorOutput methods

    internal func didFetchData(_ data: [SkillModel]) {
        self.collectionData = data
    }
    
    //MARK: SkillsViewOutput methods

    internal func viewIsReady() {
        interactor.loadData()
    }

    internal func viewWillAppear() {

    }

    //MARK:

}
