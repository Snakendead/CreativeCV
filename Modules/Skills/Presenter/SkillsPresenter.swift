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
//            _ = self_.collectionData[indexPath.row]

        }

        collectionMediator.cellSelectionClosure = {
            [weak self]
            (indexPath) in
            guard let self_ = self else { return }
//            _ = self_.collectionData[indexPath.row]

        }

        collectionMediator.dataCount = 0
    }

    //MARK: SkillsInteractorOutput methods

    internal func viewIsReady() {

    }

    internal func viewWillAppear() {

    }

    //MARK:

    internal func getViewLayer() -> Any {
        return viewInput
    }
}
