//
//  TableViewItemController.swift
//  snapKitLayout
//
//  Created by unvireak on 13/6/24.
//

import UIKit
import SnapKit

class TableViewItemController: UIViewController {
 
    
    var folder: Folder!
    
    let tableView = UITableView()

    let searchBar: UISearchBar = {
        let view = UISearchBar()
        view.placeholder = "Search Items"
        view.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        setupView()
        addNewRightBarButtonItem()
    }

    func addNewRightBarButtonItem() {
        let doneRightButton = UIBarButtonItem(image: .add, style: .plain, target: self, action: #selector(addButton))
        navigationItem.rightBarButtonItems = [doneRightButton]
    }

    @objc func addButton() {
        let viewController = CreateItemTableViewController()
        viewController.delegate = self
        navigationController?.pushViewController(viewController, animated: true)
    }

    func setupView() {
        view.addSubview(tableView)
        tableView.tableHeaderView = searchBar
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension TableViewItemController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return folder.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if cell.detailTextLabel == nil {
               cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
           }
        let item = folder.items[indexPath.row]
        cell.textLabel?.text = item.title
        cell.detailTextLabel?.text = item.detail 
        return cell
    }
    
    
}

extension TableViewItemController:  UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedRow = folder.items[indexPath.row]
        
        let viewController = CreateItemTableViewController()
        viewController.delegate = self
        viewController.item = selectedRow
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] _, _, complete in
            self?.confirmDeleteItem(at: indexPath) { confirmed in
                if confirmed {
                    self?.deleteItem(at: indexPath)
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
         let alertController = UIAlertController(title: "Confirm Deletion", message: "Are you sure you want to delete this item?", preferredStyle: .alert)
         
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
    
    func deleteItem(at indexPath: IndexPath) {
        folder.items.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        DataManager.shared.saveFolder(folder) // Save changes to DataManager
    }
    
    func editdata(at indexPath: IndexPath){
        let viewController = CreateItemTableViewController()
//             let item = folder.items[indexPath.row]
             viewController.item = folder.items[indexPath.row]
             viewController.delegate = self
             navigationController?.pushViewController(viewController, animated: true)
         
    }
}

extension TableViewItemController: CreateItemTableViewDelegate {
    func saveData(note: Item) {
            if let index = folder.items.firstIndex(where: { $0.id == note.id }) {
                folder.items[index] = note
                tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .fade)
               
            } else {
                folder.items.append(note)
                tableView.insertRows(at: [IndexPath(row: folder.items.count - 1, section: 0)], with: .fade)
               
            }
            DataManager.shared.saveFolder(folder)
        }
        
        func updateData(note: Item) {
            if let index = folder.items.firstIndex(where: { $0.id == note.id }) {
                folder.items[index] = note
                tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
            }
            DataManager.shared.saveFolder(folder)
        }
}
