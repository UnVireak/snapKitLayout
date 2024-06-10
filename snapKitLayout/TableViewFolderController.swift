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
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints{make in
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
        cell.textLabel?.text = folder.title
//        cell.detailTextLabel?.text = folder.detail // Set the detail text label
        return cell
    }
    
    
}
extension TableViewFolderController: UITableViewDelegate{}

extension TableViewFolderController: CreateFolderTableViewDelegate{
    func saveData(folder: Folder) {
        func saveData(folder: Folder) {
            DataManager.shared.saveFolder(folder)
            folderNote = DataManager.shared.folders
            tableView.reloadData()

        }
    }
    
    func updateData(folder: Folder) {
        DataManager.shared.saveFolder(folder)
              folderNote = DataManager.shared.folders
              tableView.reloadData()
        }
    
}
