//
//  EducationEducationCollectionMediator.swift
//  CreativeCV
//
//  Created by Vladimir Vasilyev on 09/03/2020.
//  Copyright © 2020 Revolage. All rights reserved.
//

import UIKit

class EducationCollectionMediator: NSObject {

    var dataCount: Int = 2
    var fillCellData: ((_ cell: EducationCellViewInput, _ indexPath: IndexPath) -> Void)?

    var cellSelectionClosure: ((_ indexPath: IndexPath) -> Void)?

    dynamic init(_ xibName: String) {
        self.xibName = xibName
        super.init()
    }

    private var xibName: String
    private var tableView: UITableView!

    func fillCollection(_ tableView: UITableView) {

    }

    func setupCollectionUI() {

    }
}
