//
//  MainViewController.swift
//  RxCustomTable
//
//  Created by Ruslan Akberov on 20.10.2019.
//  Copyright © 2019 Ruslan Akberov. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = MainViewModel()
    let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, User>>(configureCell: { section, tableView, indexPath, item in
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
        cell.textLabel?.text = "\(item.firstName) \(item.lastName), \(item.age)"
        return cell
    }, titleForHeaderInSection: { dataSource, sectionIndex in
        return dataSource[sectionIndex].model
    })
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getUsers()
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: bag)
    }
    


}

