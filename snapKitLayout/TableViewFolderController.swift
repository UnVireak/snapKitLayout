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
        AddNewRightBarButtonFolder ()
    }
    func AddNewRightBarButtonFolder (){
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
        cell.detailTextLabel?.text = "\(folder.items.count)"
        cell.textLabel?.text = folder.title
        cell.imageView?.image = UIImage(systemName: "folder")
        cell.accessoryType = .disclosureIndicator
//                    cell.imageView?.tintColor = .systemRed
//        cell.detailTextLabel?.text = folder.detail // Set the detail text label
        return cell
    }
    
    
}
extension TableViewFolderController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedFolder = folderNote[indexPath.row]
        let viewController = TableViewItemController()
        viewController.folder = selectedFolder
        navigationController?.pushViewController(viewController, animated: true)
             
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){ [weak self] _, _, complete in
            self?.confirmDeleteItem(at: indexPath) { confirmed in
                if confirmed {
                    self?.deleteFolder(at: indexPath)
                }
                complete(confirmed)
            }
            
        }
        
        let editAction = UIContextualAction(style: .normal, title: "Edit") { [weak self] _, _, complete in
            
            self?.editdata(at: indexPath)
            complete(true)
        }
        editAction.backgroundColor = UIColor(red: 0/255, green: 127/255, blue: 255/255, alpha: 1.0)
        
        let config = UISwipeActionsConfiguration(actions: [deleteAction, editAction])
        config.performsFirstActionWithFullSwipe = false
        return config
    }
    func confirmDeleteItem(at indexPath: IndexPath, completion: @escaping (Bool) -> Void) {
         let alertController = UIAlertController(title: "Confirm Deletion", message: "Are you sure you want to delete this folder?", preferredStyle: .alert)
         
         let confirmAction = UIAlertAction(title: "Delete", style: .destructive) { _ in
             completion(true)
         }
         
         let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
             completion(false)
         }
         
         alertController.addAction(confirmAction)
         alertController.addAction(cancelAction)
         
         present(alertController, animated: true, completion: nil)
     }
    
    func deleteFolder(at indexPath: IndexPath) {
        DataManager.shared.removeFolder(at: indexPath.item)
        folderNote.remove(at: indexPath.item)
        tableView.deleteRows(at: [indexPath], with: .none)
    }
    
    @objc func editdata(at indexPath: IndexPath){
        let viewController = CreateFolderTableViewController()
        viewController.delegate = self
           viewController.folder = folderNote[indexPath.row]
           navigationController?.pushViewController(viewController, animated: true)
    }
    
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
