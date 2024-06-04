//
//  SiginScreenViewController.swift
//  snapKitLayout
//
//  Created by unvireak on 3/6/24.
//

import UIKit
import SnapKit

class SiginScreenViewController: UIViewController {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .darkPurple
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
    
    let stackLogo: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .center
        view.distribution = .fill
        return view
    }()
    
    let imageLogin: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "loginLogo")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    let loginLabelStack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 10
        view.alignment = .center
        view.distribution = .fill
        return view
    }()
    
    let loginLabel: UILabel = {
        let view = UILabel()
        view.text = "Login"
        view.font = .systemFont(ofSize: 40, weight: .bold)
        view.textColor = .white
        view.textAlignment = .left
        return view
    }()
    
    let loginTitle: UILabel = {
        let view = UILabel()
        view.text = "Please sign in to continue."
        view.font = .systemFont(ofSize: 17, weight: .regular)
        view.textColor = .white
        view.textAlignment = .left
        return view
    }()
    
    let textInputContainerStack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fill
        view.alignment = .center
        view.spacing = 20
        return view
    }()
    
    let emailContainerView: UIView = {
        let view = UIView()
//        view.backgroundColor = UIColor(red: 43/255.0, green: 42/255.0, blue: 60/255.0, alpha: 1.0)
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
              string: "user123@email.com",
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
    
    let passwordContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 43/255.0, green: 42/255.0, blue: 60/255.0, alpha: 1.0)
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    let passwordStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .center
        return stackView
    }()
    
    let passwordIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "lock")
        imageView.tintColor = .white
        return imageView
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(
              string: "password",
              attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
          )
        textField.textColor = .white
        textField.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        textField.backgroundColor = .clear
        textField.borderStyle = .none
        return textField
    }()
    
    let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "PASSWORD"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        return label
    }()
    
    let buttonContainerStack: UIStackView = {
        let view  = UIStackView()
        view.axis = .vertical
        view.distribution = .fill
        view.alignment = .center
        view.spacing = 10
        
        return view
    }()
    
    let loginButton: UIButton = {
        let view = UIButton()
        view.setTitle("LOGIN", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        view.backgroundColor = .systemBlue
        view.layer.cornerRadius = 10
        
        return view
    }()
    
    let forgetPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Forget Password?", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
//        button.addTarget(self, action: #selector(forgetPasswordTapped), for: .touchUpInside)
        return button
    }()
    
    let signupContainerView: UIView = {
        let view = UIView()
//        view.backgroundColor = .yellow
        return view
            }()
    
    let signupContainerStack: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .equalSpacing
        view.alignment = .center
        return view
    }()
    
    let signupTitle: UILabel = {
        let view = UILabel()
        view.text = "Don't have an account?"
        view.font = .systemFont(ofSize: 17, weight: .regular)
        view.textColor = .white
        return view
    }()
    
    let sigupButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign up", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
//        button.addTarget(self, action: #selector(forgetPasswordTapped), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Login"
        view.backgroundColor = .darkPurple
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        setupView()
    }
    
    func setupView() {
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
        
        mainStack.addArrangedSubview(stackLogo)
        stackLogo.addArrangedSubview(imageLogin)
        imageLogin.snp.makeConstraints { make in
            make.width.height.equalTo(200)
        }
        
        mainStack.addArrangedSubview(loginLabelStack)
        
        loginLabelStack.addArrangedSubview(loginLabel)
        loginLabel.snp.makeConstraints { make in
            make.width.equalTo(loginLabelStack)
        }
        loginLabelStack.addArrangedSubview(loginTitle)
        loginTitle.snp.makeConstraints { make in
            make.width.equalTo(loginLabelStack)
        }
        
        // Add email container view
        mainStack.addArrangedSubview(emailContainerView)
        emailContainerView.snp.makeConstraints { make in
            make.height.equalTo(60)
            make.left.right.equalTo(mainStack)
        }
//
        // Add email label
        emailContainerView.addSubview(emailLabel)
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(emailContainerView).offset(8)
            make.left.equalTo(emailContainerView).offset(12)
        }
        
        // Add email stack
        emailContainerView.addSubview(emailStack)
        emailStack.snp.makeConstraints { make in
            make.left.equalTo(emailContainerView).offset(12)
            make.right.equalTo(emailContainerView).offset(-12)
            make.bottom.equalTo(emailContainerView).offset(-8)
        }
        
        // Add elements to email stack
        emailStack.addArrangedSubview(emailIconImageView)
        emailIconImageView.snp.makeConstraints { make in
            make.width.height.equalTo(20)
        }
        
        emailStack.addArrangedSubview(emailTextField)
        
        mainStack.addArrangedSubview(passwordContainerView)
        passwordContainerView.snp.makeConstraints { make in
            make.height.equalTo(60)
            make.left.right.equalTo(mainStack)
        }
        passwordContainerView.addSubview(passwordLabel)
        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordContainerView).offset(8)
            make.left.equalTo(passwordContainerView).offset(12)
        }
        passwordContainerView.addSubview(passwordStack)
        passwordStack.snp.makeConstraints { make in
            make.left.equalTo(passwordContainerView).offset(12)
            make.right.equalTo(passwordContainerView).offset(-12)
            make.bottom.equalTo(passwordContainerView).offset(-8)
        }
        
        // Add elements to email stack
        passwordStack.addArrangedSubview(passwordIconImageView)
        passwordIconImageView.snp.makeConstraints { make in
            make.width.height.equalTo(20)
        }
        
        passwordStack.addArrangedSubview(passwordTextField)
        mainStack.addArrangedSubview(buttonContainerStack)
        buttonContainerStack.snp.makeConstraints{make in
            make.left.right.equalTo(mainStack)
        }
        
        buttonContainerStack.addArrangedSubview(loginButton)
        loginButton.snp.makeConstraints{ make in
            make.left.equalTo(50)
            make.right.equalTo(-50)
            make.height.equalTo(50)
            //            make.width.equalTo(buttonContainerStack)
            
        }
        
        buttonContainerStack.addArrangedSubview(forgetPasswordButton)
        forgetPasswordButton.snp.makeConstraints{make in
            make.left.equalTo(50)
            make.right.equalTo(-50)

            
        }
        
        mainStack.addArrangedSubview(signupContainerView)
        signupContainerView.snp.makeConstraints{make in
            make.height.equalTo(60)
            make.left.right.equalTo(mainStack)
            make.bottom.equalTo(mainStack).offset(-30)
        }
        
        signupContainerView.addSubview(signupContainerStack)
        signupContainerStack.snp.makeConstraints{make in
            make.center.equalTo(signupContainerView) // Center the stack view within its parent
                make.left.greaterThanOrEqualTo(signupContainerView).offset(12)
                make.right.lessThanOrEqualTo(signupContainerView).offset(-12)
                make.top.greaterThanOrEqualTo(signupContainerView).offset(8)
                make.bottom.lessThanOrEqualTo(signupContainerView).offset(-8)
            
        }
        
        signupContainerStack.addArrangedSubview(signupTitle)
        signupTitle.snp.makeConstraints{make in
            make.height.equalTo(20)
        }
        signupContainerStack.addArrangedSubview(sigupButton)
        sigupButton.snp.makeConstraints{make in
            make.height.equalTo(20)
        }
        
        
        sigupButton.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
    }
 @objc func signupButtonTapped(){
        let signupScreen = SignupScreenViewController()
//     signupScreen.modalPresentationStyle = .fullScreen // Optional: set the presentation style
//         present(signupScreen, animated: true, completion: nil)
     navigationController?.pushViewController(signupScreen, animated: true)
     
      
    }

}


extension UIColor {
    static let darkPurple: UIColor = {
        return UIColor(red: 75/255.0, green: 0/255.0, blue: 130/255.0, alpha: 1.0)
    }()
    
    static let textFieldCollor:  UIColor = {
        return UIColor(red: 43/255.0, green: 42/255.0, blue: 60/255.0, alpha: 1.0)
    }()
//    static let lightBle: UIColor = {
//        return UIColor(red: 0.8, green: 0.85, blue: 1.0, alpha: 1)
//    }()
}
