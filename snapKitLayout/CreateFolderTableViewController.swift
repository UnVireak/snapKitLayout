//
//  CreateNoteViewController.swift
//  snapKitLayout
//
//  Created by unvireak on 8/6/24.
//

import UIKit
import SnapKit

protocol CreateFolderTableViewDelegate {
    func saveData(folder: Folder)
    func updateData(folder: Folder)
}

class CreateFolderTableViewController: UIViewController, UITextFieldDelegate {
    var delegate: CreateFolderTableViewDelegate?
    var folder: Folder?
    
    let textFieldFolder: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter text here"
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    let clearButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        button.tintColor = .gray
        button.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        button.isHidden = true
        button.addTarget(self, action: #selector(clearTextField), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "New folder"
        
        setupView()
        textFieldFolder.delegate = self
        addDoneRightBarButtonItem()
        
        // Pre-fill the text field if editing an existing folder
        if let folder = folder {
            textFieldFolder.text = folder.title
            clearButton.isHidden = folder.title.isEmpty
        }
    }
    
    func addDoneRightBarButtonItem() {
        let doneRightButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButton))
        navigationItem.rightBarButtonItems = [doneRightButton]
    }
    
    @objc func doneButton() {
        let folderName = textFieldFolder.text ?? ""
        if folderName.isEmpty {
            let alertController = UIAlertController(title: "Empty!", message: "Title can't be empty.", preferredStyle: .alert)
            let alertActionOK = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alertController.addAction(alertActionOK)
            present(alertController, animated: true)
        } else {
            if var myfolder = folder {
                myfolder.title = folderName
                delegate?.updateData(folder: myfolder)
            } else {
                let newFolder = Folder(id: UUID(), title: folderName, items: [])
                delegate?.saveData(folder: newFolder)
            }
            
            navigationController?.popViewController(animated: true)
        }
    }
    
    func setupView() {
        view.addSubview(textFieldFolder)
        textFieldFolder.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(40)
        }
        
        // Set the clear button as the right view of the text field
        textFieldFolder.rightView = clearButton
        textFieldFolder.rightViewMode = .always
    }
    
    @objc func clearTextField() {
        textFieldFolder.text = ""
        clearButton.isHidden = true
    }
    
    // UITextFieldDelegate method to detect changes in the text field
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = (textField.text ?? "") as NSString
        let updatedText = currentText.replacingCharacters(in: range, with: string)
        
        clearButton.isHidden = updatedText.isEmpty
        
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        clearButton.isHidden = textField.text?.isEmpty ?? true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        clearButton.isHidden = true
    }
}
