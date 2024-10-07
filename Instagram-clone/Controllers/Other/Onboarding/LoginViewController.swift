//
//  LoginViewController.swift
//  Instagram-clone
//
//  Created by Santiago Varela on 29/09/24.
//

import SafariServices
import UIKit

class LoginViewController: UIViewController {
    enum Constants {
        static let cornerRadius: CGFloat = 8.0
    }

    private let usernameEmailTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "Username or Email..."
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor

        return field
    }()

    private let passwordTextField: UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        field.placeholder = "Password..."
        field.returnKeyType = .continue
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor

        return field
    }()

    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadius
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)

        return button
    }()

    private let termsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Terms of service", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)

        return button
    }()

    private let privacyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Privacy Policy", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)

        return button
    }()

    private let createAccountButton: UIButton = {
        let button = UIButton()
        button.setTitle("New User? Create an account", for: .normal)
        button.setTitleColor(.label, for: .normal)

        return button
    }()

    private let headerView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        let backgroundImageView = UIImageView(image: UIImage(named: "gradient"))
        view.addSubview(backgroundImageView)

        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        createAccountButton.addTarget(self, action: #selector(didTapCreateAccountButton), for: .touchUpInside)
        termsButton.addTarget(self, action: #selector(didTapTermsButton), for: .touchUpInside)
        privacyButton.addTarget(self, action: #selector(didTapPrivacyButton), for: .touchUpInside)

        usernameEmailTextField.delegate = self
        passwordTextField.delegate = self

        addSubviews()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        headerView.frame = CGRect(
            x: 0.0,
            y: 0.0,
            width: view.width,
            height: view.height / 3.0
        )

        usernameEmailTextField.frame = CGRect(
            x: 25,
            y: headerView.bottom + 40,
            width: view.width - 50,
            height: 52.0
        )

        passwordTextField.frame = CGRect(
            x: 25,
            y: usernameEmailTextField.bottom + 10,
            width: view.width - 50,
            height: 52.0
        )

        loginButton.frame = CGRect(
            x: 25,
            y: passwordTextField.bottom + 10,
            width: view.width - 50,
            height: 52.0
        )

        createAccountButton.frame = CGRect(
            x: 25,
            y: loginButton.bottom + 10,
            width: view.width - 50,
            height: 52.0
        )

        termsButton.frame = CGRect(
            x: 10,
            y: view.height - view.safeAreaInsets.bottom - 100,
            width: view.width - 20,
            height: 50.0
        )

        privacyButton.frame = CGRect(
            x: 10,
            y: view.height - view.safeAreaInsets.bottom - 50,
            width: view.width - 20,
            height: 50.0
        )

        configureHeaderView()
    }

    private func configureHeaderView() {
        guard headerView.subviews.count == 1, let backgroundView = headerView.subviews.first else {
            return
        }

        backgroundView.frame = headerView.bounds

        let imageView = UIImageView(image: UIImage(named: "text"))
        headerView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(
            x: headerView.width / 4.0,
            y: view.safeAreaInsets.top,
            width: headerView.width / 2.0,
            height: headerView.height - view.safeAreaInsets.top
        )
    }

    private func addSubviews() {
        view.addSubview(usernameEmailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)
        view.addSubview(headerView)
        view.addSubview(createAccountButton)
    }

    @objc private func didTapLoginButton() {
        passwordTextField.resignFirstResponder()
        usernameEmailTextField.resignFirstResponder()

        guard let usernameEmail = usernameEmailTextField.text, !usernameEmail.isEmpty,
              let password = passwordTextField.text, !password.isEmpty, password.count >= 8
        else {
            return
        }

        var username: String?
        var email: String?

        if usernameEmail.contains("@"), usernameEmail.contains(".") {
            email = usernameEmail
        } else {
            username = usernameEmail
        }

        AuthManager.shared.loginUser(with: username, email: email, password: password) { success in
            DispatchQueue.main.async {
                if success {
                    self.dismiss(animated: true)
                } else {
                    let alert = UIAlertController(title: "Log In Error", message: "We Were Unable To Log In", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
                    self.present(alert, animated: true)
                }
            }
        }
    }

    @objc private func didTapTermsButton() {
        guard let url = URL(string: "https://help.instagram.com/581066165581870") else {
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }

    @objc private func didTapPrivacyButton() {
        guard let url = URL(string: "https://help.instagram.com/196883487377501") else {
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }

    @objc private func didTapCreateAccountButton() {
        let vc = RegistrationViewController()
        vc.title = "Create Account"
        present(UINavigationController(rootViewController: vc), animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameEmailTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            didTapLoginButton()
        }

        return true
    }
}
