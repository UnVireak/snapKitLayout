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
        tf.backgroundColor = .white
        return tf
    }()
    
    let textFieldDetail: UITextView = {
        let view = UITextView()
//        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 0
        view.layer.cornerRadius = 8.0
        view.backgroundColor = .white
        
        return view
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .systemGray6
        return scrollView
    }()
    
    let mainView: UIView = {
        let mainView = UIView()
//        mainView.backgroundColor = .systemPink
        return mainView
    }()
    
    let mainStack: UIStackView = {
        let mainStack = UIStackView()
        mainStack.axis = .vertical
        mainStack.alignment = .fill
        mainStack.distribution = .fill
        mainStack.spacing = 30
        return mainStack
    }()
        
        let textFildStack: UIStackView = {
            let view = UIStackView()
            view.axis = .vertical
            view.alignment = .fill
            view.distribution = .fill
            view.spacing = 10
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
        
//        textFieldTitle.setContentHuggingPriority(.defaultHigh, for: .vertical)
//        textFieldTitle.setContentCompressionResistancePriority(.required, for: .vertical)
//
//        textFieldDetail.setContentHuggingPriority(.defaultLow, for: .vertical)
//        textFieldDetail.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
//        
        NotificationCenter.default.addObserver(self, selector: #selector(showKeyboard), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    @objc func showKeyboard(notification: Notification){
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        
        let keyboardHeight = keyboardFrame.height
//        let keyboardHeight = keyboardFrame.cgRectValue.height
        let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
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
        //        view.addSubview(textFieldTitle)
        //        textFieldTitle.snp.makeConstraints { make in
        //            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
        //            make.leading.trailing.equalToSuperview().inset(20)
        //            make.height.equalTo(40)
        //        }
        
        //        view.addSubview(textFieldDetail)
        //        textFieldDetail.snp.makeConstraints { make in
        //            make.top.equalTo(textFieldTitle.snp.bottom).offset(20)
        //            make.leading.trailing.equalToSuperview().inset(20)
        //            make.height.equalTo(100)
        //        }
        
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        scrollView.addSubview(mainView)
        mainView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView.contentLayoutGuide)
            make.width.equalTo(scrollView.frameLayoutGuide)
        }
        
        mainView.addSubview(mainStack)
        mainStack.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(20)
        }
        
        mainStack.addArrangedSubview(textFildStack)
        textFildStack.snp.makeConstraints{make in 
            make.edges.equalTo(mainStack)
        }
        textFildStack.addArrangedSubview(textFieldTitle)
        textFieldTitle.snp.makeConstraints{make in
            make.width.equalTo(250)
            make.height.equalTo(40)
        }
        textFildStack.addArrangedSubview(textFieldDetail)
        textFieldDetail.snp.makeConstraints{make in
            make.width.equalTo(250)
            make.height.greaterThanOrEqualTo(600)
        }
    }
}
