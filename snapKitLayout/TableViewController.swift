//
//  TableViewController.swift
//  snapKitLayout
//
//  Created by unvireak on 7/6/24.
//

import UIKit
import SnapKit

class TableViewController: UIViewController {

    let tableView = UITableView ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        setupView()
        
    }
    
    func setupView(){
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints{make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    


}
extension TableViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Row \(indexPath.row)"
        return cell
    }
    
    
}
