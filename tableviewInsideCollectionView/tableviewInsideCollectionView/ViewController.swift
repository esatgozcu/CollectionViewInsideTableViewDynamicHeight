//
//  ViewController.swift
//  tableviewInsideCollectionView
//
//  Created by mac on 10/12/20.
//  Copyright © 2020 Esat Gozcu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private lazy var tableView: UITableView = {
           let tableView = UITableView(frame: .zero, style: UITableView.Style.plain)
           return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.setupUI()
    }
    
    private func setupTableView() {
        tableView.register(VerticalCell.self, forCellReuseIdentifier: "VerticalCell")
        tableView.register(HorizontalCell.self, forCellReuseIdentifier: "HorizontalCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
    }
    
    private func setupUI() {
        self.view.addSubview(self.tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}

extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HorizontalCell", for: indexPath) as! HorizontalCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "VerticalCell", for: indexPath) as! VerticalCell
            return cell
        default:
            return UITableViewCell()
        }
    }
}
