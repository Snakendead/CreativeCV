//
//  SkillsSkillsViewController.swift
//  CreativeCV
//
//  Created by Vladimir Vasilyev on 09/03/2020.
//  Copyright © 2020 Revolage. All rights reserved.
//

import UIKit

class SkillsViewController: BaseModuleViewController, SkillsViewInput {

    var output: SkillsViewOutput!
    var collectionMediator: SkillsCollectionMediator!

    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Initialization
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.collectionMediator = SkillsCollectionMediator("SkillsTableViewCell")
        self.output = SkillsPresenter(viewInput: self, collectionMediator: self.collectionMediator)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.collectionMediator = SkillsCollectionMediator("SkillsTableViewCell")
        self.output = SkillsPresenter(viewInput: self, collectionMediator: self.collectionMediator)
    }

    override func setupDependencies() {
        collectionMediator.fillCollection(tableView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupActions()
        output.viewIsReady()
    }

    private func setupUI() {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    private func setupActions() {

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output.viewWillAppear()
    }

    //MARK: SkillsViewInput methods

    func showSkillInfo(with text: String) {
        let alert = UIAlertController(title: nil, message: text, preferredStyle: UIAlertController.Style.alert)
        let cancelAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
        
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
}
