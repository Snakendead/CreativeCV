//
//  SkillsSkillsCollectionMediator.swift
//  CreativeCV
//
//  Created by Vladimir Vasilyev on 09/03/2020.
//  Copyright © 2020 Revolage. All rights reserved.
//

import UIKit

class SkillsCollectionMediator: NSObject, UITableViewDelegate, UITableViewDataSource {

    var dataCount: Int = 0 {
        didSet {
            tableView?.reloadData()
        }
    }
    var fillCellData: ((_ cell: SkillsCellViewInput, _ indexPath: IndexPath) -> Void)?

    var cellSelectionClosure: ((_ cell: SkillsCellViewInput, _ indexPath: IndexPath) -> Void)?

    dynamic init(_ xibName: String) {
        self.xibName = xibName
        super.init()
    }

    private var xibName: String
    private var tableView: UITableView!

    func fillCollection(_ tableView: UITableView) {
        self.tableView = tableView
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let nib = UINib(nibName: xibName, bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: xibName)
    }

    func setupCollectionUI() {

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataCount
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: xibName, for: indexPath)
        
        fillCellData?(cell as! SkillsCellViewInput, indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cellSelectionClosure?(cell as! SkillsCellViewInput, indexPath)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
