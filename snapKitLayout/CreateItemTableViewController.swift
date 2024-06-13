//
//  CreateNoteViewController.swift
//  snapKitLayout
//
//  Created by unvireak on 8/6/24.
//

import UIKit
import SnapKit

protocol CreateItemTableViewDelegate: AnyObject {
    func saveData(note: Item)
    func updateData(note: Item)
}

class CreateItemTableViewController: UIViewController, UITextFieldDelegate {
    weak var delegate: CreateItemTableViewDelegate?
    var item: Item?
    let textFieldTitle: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter title here"
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    let textFieldDetail: UITextView = {
        let view = UITextView()
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 1.0
        view.layer.cornerRadius = 8.0
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
//        navigationItem.title = "New Item"
        setupView()
        DoneRightBarButtonItem()
        
        textFieldTitle.text = item?.title
        textFieldDetail.text = item?.detail
    }
    
    func DoneRightBarButtonItem() {
        let doneRightButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButton))
        navigationItem.rightBarButtonItem = doneRightButton
    }
    
    @objc func doneButton() {
        validateTextField()
    }
    
    func validateTextField() {
        guard let title = textFieldTitle.text, !title.isEmpty else {
            presentAlertAction()
            return
        }
    
        let newItem = Item(id: item?.id ?? UUID(), title: textFieldTitle.text ?? "", detail: textFieldDetail.text ?? "")
              
              if let _ = item {
                  delegate?.updateData(note: newItem)
                  navigationItem.title = "New note"
              } else {
                  delegate?.saveData(note: newItem)
                  navigationItem.title = "Edit note"
              }
              
              navigationController?.popViewController(animated: true)
          }

    
    
    func presentAlertAction() {
        let alertController = UIAlertController(title: "Error", message: "Title cannot be empty", preferredStyle: .alert)
        let handleOK = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(handleOK)
        present(alertController, animated: true, completion: nil)
    }
    
    func setupView() {
        view.addSubview(textFieldTitle)
        textFieldTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(40)
        }
        
        view.addSubview(textFieldDetail)
        textFieldDetail.snp.makeConstraints { make in
            make.top.equalTo(textFieldTitle.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(100)
        }
    }
}
