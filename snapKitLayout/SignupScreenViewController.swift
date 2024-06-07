//
//  SignupScreenViewController.swift
//  snapKitLayout
//
//  Created by unvireak on 3/6/24.
//

import UIKit

class SignupScreenViewController: UIViewController {
    
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = .darkPurple
        return view
    }()
    
    let mainView: UIView = {
        let view = UIView()
        return view
    }()
    let button1: UIButton = {
        let view = UIButton()
        view.setTitle("Login", for: .normal)
        view.backgroundColor = .darkGray
        return view
    }()
    let button2: UIButton = {
        let view = UIButton()
        view.setTitle("Login", for: .normal)
        view.backgroundColor = .darkGray
        return view
    }()
    let mainStack: UIStackView = {
        let mainStack = UIStackView()
        mainStack.axis = .vertical
        mainStack.alignment = .fill
        mainStack.distribution = .fill
        mainStack.spacing = 40
        return mainStack
    }()
    let createAccStack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fill
        view.alignment = .center
        view.spacing = 10
        return view
    }()
    let createaAccTitle: UILabel = {
        let view = UILabel()
        view.text = "Create Account"
        view.font = .systemFont(ofSize: 40, weight: .bold)
        view.textColor = .white
        view.textAlignment = .left
        return view
    }()
    let createAccSubTitle: UILabel = {
        let view = UILabel()
        view.text = "Please fill the input blow here."
        view.font = .systemFont(ofSize: 17, weight: .regular)
        view.textColor = .white
        view.textAlignment = .left
        return view
    }()
    
    let formStack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fill
        view.alignment = .center
        view.spacing = 20
        return view
    }()
    
    let usernameContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .textFieldCollor
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    let usernameStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .center
        return stackView
    }()
    
    let usernameIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person")
        imageView.tintColor = .white
        return imageView
    }()
    
    let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(
              string: "username",
              attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
          )
          textField.textColor = .white
        textField.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        textField.backgroundColor = .clear
        textField.borderStyle = .none
        return textField
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "USERNAME"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        return label
    }()
    
    // phone
    
    let phoneContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .textFieldCollor
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    let phoneStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .center
        return stackView
    }()
    
    let phoneIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "iphone.gen3")
        imageView.tintColor = .white
        return imageView
    }()
    
    let phoneTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(
              string: "number phone",
              attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
          )
          textField.textColor = .white
        textField.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        textField.backgroundColor = .clear
        textField.borderStyle = .none
        return textField
    }()
    
    let phoneLabel: UILabel = {
        let label = UILabel()
        label.text = "NUMBER PHONE"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        return label
    }()
    
    // email
    
    let emailContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .textFieldCollor
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    let emailStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .center
        return stackView
    }()
    
    let emailIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "envelope")
        imageView.tintColor = .white
        return imageView
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(
              string: "email",
              attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
          )
          textField.textColor = .white
        textField.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        textField.backgroundColor = .clear
        textField.borderStyle = .none
        return textField
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "EMAIL"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        return label
    }()
    
    // password
    
    let passContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .textFieldCollor
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    let passStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .center
        return stackView
    }()
    
    let passIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "lock")
        imageView.tintColor = .white
        return imageView
    }()
    
    let passTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(
              string: "password",
              attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
          )
          textField.textColor = .white
        textField.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        textField.backgroundColor = .clear
        textField.borderStyle = .none
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let passLabel: UILabel = {
        let label = UILabel()
        label.text = "PASSWORD"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        return label
    }()
    
    // confirm password
    
    let confirmPassContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .textFieldCollor
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    let confirmPassStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .center
        return stackView
    }()
    
    let confirmPassIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "lock")
        imageView.tintColor = .white
        return imageView
    }()
    
    let confirmPassTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(
              string: "confirm password",
              attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
          )
          textField.textColor = .white
        textField.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        textField.backgroundColor = .clear
        textField.borderStyle = .none
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let confirmPassLabel: UILabel = {
        let label = UILabel()
        label.text = "CONFIRM PASSWORD"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        return label
    }()
    
    // signup button
    
    let buttonContainerStack: UIStackView = {
        let view  = UIStackView()
        view.axis = .vertical
        view.distribution = .fill
        view.alignment = .center
        view.spacing = 10
        
        return view
    }()
    
    let signupButton: UIButton = {
        let view = UIButton()
        view.setTitle("SIGN UP", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        view.backgroundColor = .systemBlue
        view.layer.cornerRadius = 10
        
        return view
    }()
    
    let signinContainerView: UIView = {
        let view = UIView()
//        view.backgroundColor = .yellow
        return view
            }()
    
    let signinContainerStack: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .equalSpacing
        view.alignment = .center
        return view
    }()
    
    let signinTitle: UILabel = {
        let view = UILabel()
        view.text = "Already have an account?"
        view.font = .systemFont(ofSize: 17, weight: .regular)
        view.textColor = .white
        return view
    }()
    
    let signinButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Signin", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
//        button.addTarget(self, action: #selector(forgetPasswordTapped), for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkPurple
        
        setupView()
    }
    
    func setupView(){
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints{make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        scrollView.addSubview(mainView)
        mainView.snp.makeConstraints{make in
            make.edges.equalTo(scrollView.contentLayoutGuide)
            make.width.equalTo(scrollView.frameLayoutGuide)
        }
     
        
        mainView.addSubview(mainStack)
        mainStack.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(20)
        }
        
        mainStack.addArrangedSubview(createAccStack)
        
        createAccStack.addArrangedSubview(createaAccTitle)
        createaAccTitle.snp.makeConstraints{make in
            make.width.equalTo(createAccStack)
        }
        
        createAccStack.addArrangedSubview(createAccSubTitle)
        createAccSubTitle.snp.makeConstraints{make in
            make.width.equalTo(createAccStack)
        }
        
        mainStack.addArrangedSubview(formStack)
        formStack.snp.makeConstraints{make in
            make.left.right.equalTo(mainStack)
        }
        formStack.addArrangedSubview(usernameContainerView)
        usernameContainerView.snp.makeConstraints{make in
            make.height.equalTo(60)
            make.left.right.equalTo(mainStack)
        }
        usernameContainerView.addSubview(usernameLabel)
        usernameLabel.snp.makeConstraints { make in
            make.top.equalTo(usernameContainerView).offset(8)
            make.left.equalTo(usernameContainerView).offset(12)
        }
        usernameContainerView.addSubview(usernameStack)
        usernameStack.snp.makeConstraints{make in
            make.left.equalTo(usernameContainerView).offset(12)
            make.right.equalTo(usernameContainerView).offset(-12)
            make.bottom.equalTo(usernameContainerView).offset(-8)
        }
        usernameStack.addArrangedSubview(usernameIconImageView)
        usernameIconImageView.snp.makeConstraints{make in
            make.width.height.equalTo(20)
        }
        usernameStack.addArrangedSubview(usernameTextField)

        // phone
        
        formStack.addArrangedSubview(phoneContainerView)
        phoneContainerView.snp.makeConstraints{make in
            make.height.equalTo(60)
            make.left.right.equalTo(mainStack)
        }
        phoneContainerView.addSubview(phoneLabel)
        phoneLabel.snp.makeConstraints { make in
            make.top.equalTo(phoneContainerView).offset(8)
            make.left.equalTo(phoneContainerView).offset(12)
        }
        phoneContainerView.addSubview(phoneStack)
        phoneStack.snp.makeConstraints{make in
            make.left.equalTo(phoneContainerView).offset(12)
            make.right.equalTo(phoneContainerView).offset(-12)
            make.bottom.equalTo(phoneContainerView).offset(-8)
        }
        phoneStack.addArrangedSubview(phoneIconImageView)
        phoneIconImageView.snp.makeConstraints{make in
            make.width.height.equalTo(20)
        }
        phoneStack.addArrangedSubview(phoneTextField)
        
        // email
        
        formStack.addArrangedSubview(emailContainerView)
        emailContainerView.snp.makeConstraints{make in
            make.height.equalTo(60)
            make.left.right.equalTo(mainStack)
        }
        emailContainerView.addSubview(emailLabel)
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(emailContainerView).offset(8)
            make.left.equalTo(emailContainerView).offset(12)
        }
        emailContainerView.addSubview(emailStack)
        emailStack.snp.makeConstraints{make in
            make.left.equalTo(emailContainerView).offset(12)
            make.right.equalTo(emailContainerView).offset(-12)
            make.bottom.equalTo(emailContainerView).offset(-8)
        }
        emailStack.addArrangedSubview(emailIconImageView)
        emailIconImageView.snp.makeConstraints{make in
            make.width.height.equalTo(20)
        }
        emailStack.addArrangedSubview(emailTextField)
        
        // password
        
        formStack.addArrangedSubview(passContainerView)
        passContainerView.snp.makeConstraints{make in
            make.height.equalTo(60)
            make.left.right.equalTo(mainStack)
        }
        passContainerView.addSubview(passLabel)
        passLabel.snp.makeConstraints { make in
            make.top.equalTo(passContainerView).offset(8)
            make.left.equalTo(passContainerView).offset(12)
        }
        passContainerView.addSubview(passStack)
        passStack.snp.makeConstraints{make in
            make.left.equalTo(passContainerView).offset(12)
            make.right.equalTo(passContainerView).offset(-12)
            make.bottom.equalTo(passContainerView).offset(-8)
        }
        passStack.addArrangedSubview(passIconImageView)
        passIconImageView.snp.makeConstraints{make in
            make.width.height.equalTo(20)
        }
        passStack.addArrangedSubview(passTextField)
        
        // confirm password
        
        formStack.addArrangedSubview(confirmPassContainerView)
        confirmPassContainerView.snp.makeConstraints{make in
            make.height.equalTo(60)
            make.left.right.equalTo(mainStack)
        }
        confirmPassContainerView.addSubview(confirmPassLabel)
        confirmPassLabel.snp.makeConstraints { make in
            make.top.equalTo(confirmPassContainerView).offset(8)
            make.left.equalTo(confirmPassContainerView).offset(12)
        }
        confirmPassContainerView.addSubview(confirmPassStack)
        confirmPassStack.snp.makeConstraints{make in
            make.left.equalTo(confirmPassContainerView).offset(12)
            make.right.equalTo(confirmPassContainerView).offset(-12)
            make.bottom.equalTo(confirmPassContainerView).offset(-8)
        }
        confirmPassStack.addArrangedSubview(confirmPassIconImageView)
        confirmPassIconImageView.snp.makeConstraints{make in
            make.width.height.equalTo(20)
        }
        confirmPassStack.addArrangedSubview(confirmPassTextField)
        
        mainStack.addArrangedSubview(buttonContainerStack)
        buttonContainerStack.snp.makeConstraints{make in
            make.left.right.equalTo(mainStack)
        }
        buttonContainerStack.addArrangedSubview(signupButton)
        signupButton.snp.makeConstraints{make in
            make.left.equalTo(50)
            make.right.equalTo(-50)
            make.height.equalTo(50)
        }
        
        mainStack.addArrangedSubview(signinContainerView)
        signinContainerView.snp.makeConstraints{make in
            make.height.equalTo(60)
            make.left.right.equalTo(mainStack)
            make.bottom.equalTo(mainStack).offset(-30)
        }
        
        signinContainerView.addSubview(signinContainerStack)
        signinContainerStack.snp.makeConstraints{make in
            make.center.equalTo(signinContainerView) // Center the stack view within its parent
                make.left.greaterThanOrEqualTo(signinContainerView).offset(12)
                make.right.lessThanOrEqualTo(signinContainerView).offset(-12)
                make.top.greaterThanOrEqualTo(signinContainerView).offset(8)
                make.bottom.lessThanOrEqualTo(signinContainerView).offset(-8)
            
        }
        
        signinContainerStack.addArrangedSubview(signinTitle)
        signinTitle.snp.makeConstraints{make in
            make.height.equalTo(20)
        }
        signinContainerStack.addArrangedSubview(signinButton)
        signinButton.snp.makeConstraints{make in
            make.height.equalTo(20)
        }
        
        
        signinButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    @objc func loginButtonTapped(){
           let signinScreen = SiginScreenViewController()
//        signupScreen.modalPresentationStyle = .fullScreen // Optional: set the presentation style
//            present(signupScreen, animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
        
         
       }
    
    
    

}
