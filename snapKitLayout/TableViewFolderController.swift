//
//  TableViewController.swift
//  snapKitLayout
//
//  Created by unvireak on 7/6/24.
//

import UIKit
import SnapKit

class TableViewFolderController: UIViewController {
    var selectedFolder: Folder?
    let tableView = UITableView ()
    var folderNote: [Folder] = []
    
    let searchBar: UISearchBar = {
        let view = UISearchBar()
//        view.showsCancelButton = true
        view.frame = CGRect(x: 10, y: 10, width: view.frame.width - 20, height: 60)
        view.placeholder = "Search Folders"
                view.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Note"
        view.backgroundColor = .systemBackground
        tableView.dataSource = self
        tableView.delegate  = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        setupView()
        AddNewRightBarButtonItem ()
    }
    func AddNewRightBarButtonItem (){
        let doneRightButton = UIBarButtonItem(image: .add, style: .plain, target: self, action: #selector(addButton))
        navigationItem.rightBarButtonItems = [doneRightButton]
    }
    
    @objc func addButton(){
        let viewController = CreateFolderTableViewController()
        viewController.delegate = self
        navigationController?.pushViewController(viewController, animated: true)
    }
    func setupView(){
        view.addSubview(searchBar)
        tableView.tableHeaderView = searchBar
//        searchBar.snp.makeConstraints{make in
//            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
//                        make.left.equalTo(view.safeAreaLayoutGuide).offset(20)
//                        make.right.equalTo(view.safeAreaLayoutGuide).offset(-20)
//            
//        }
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
//                    make.left.right.bottom.equalTo(view.safeAreaLayoutGuide)
//            make.top.equalTo(searchBar.snp.bottom).offset(20)
            make.edges.equalTo(view.safeAreaLayoutGuide)
                }
       
    }
    


}
extension TableViewFolderController: UITableViewDataSource{
     func numberOfSections(in tableView: UITableView) -> Int {
           return 1
       }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return folderNote.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let folder = folderNote[indexPath.row]
        cell.textLabel?.text = "\(folder.title) (\(folder.items.count) items)"
        cell.textLabel?.text = folder.title
        cell.imageView?.image = UIImage(systemName: "folder")
        cell.accessoryType = .disclosureIndicator
//                    cell.imageView?.tintColor = .systemRed
//        cell.detailTextLabel?.text = folder.detail // Set the detail text label
        return cell
    }
    
    
}
extension TableViewFolderController: UITableViewDelegate{
    
}

extension TableViewFolderController: CreateFolderTableViewDelegate{
    func saveData(folder: Folder) {
        
            DataManager.shared.saveFolder(folder)
            folderNote = DataManager.shared.folders
            tableView.reloadData()

        
    }
    
    func updateData(folder: Folder) {
        DataManager.shared.saveFolder(folder)
              folderNote = DataManager.shared.folders
              tableView.reloadData()
        }
    
}
