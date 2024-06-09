//
//  CreateNoteViewController.swift
//  snapKitLayout
//
//  Created by unvireak on 8/6/24.
//

import UIKit
import SnapKit

class CreateNoteViewController: UIViewController, UITextFieldDelegate {

    let textField: UITextField = {
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

        setupView()
        textField.delegate = self
    }
    
    func setupView() {
        view.addSubview(textField)
        textField.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(40)
        }
        
        // Set the clear button as the right view of the text field
        textField.rightView = clearButton
        textField.rightViewMode = .always
    }
    
    @objc func clearTextField() {
        textField.text = ""
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
