//
//  LoginViewController.swift
//  Bankey
//
//  Created by Idris on 09/04/22.
//

import UIKit

class LoginViewController: UIViewController {
	let loginView: LoginView = LoginView()
	let signInButton: UIButton = UIButton(type: .system)
	let errorMessageLabel: UILabel = UILabel()
	let titleLabel: UILabel = UILabel()
	let captionLabel: UILabel = UILabel()
	
	var username: String? {
		return loginView.usernameTextField.text
	}
	
	var password: String? {
		return loginView.passwordTextField.text
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		style()
		layout()
	}
	
}

extension LoginViewController {
	private func style() {
		signInButton.translatesAutoresizingMaskIntoConstraints = false
		signInButton.configuration = .filled()
		signInButton.configuration?.imagePadding = 8
		signInButton.setTitle("Sign In", for: [])
		signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .primaryActionTriggered)
		
		errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
		errorMessageLabel.textAlignment = .center
		errorMessageLabel.numberOfLines = 0
		errorMessageLabel.textColor = .systemRed
		errorMessageLabel.isHidden = true
		errorMessageLabel.font = UIFont.systemFont(ofSize: 14)
		errorMessageLabel.text = "Username/password are invalid"
		
		captionLabel.translatesAutoresizingMaskIntoConstraints = false
		captionLabel.textAlignment = .center
		captionLabel.numberOfLines = 0
		captionLabel.textColor = UIColor.darkGray.withAlphaComponent(0.8)
		captionLabel.font = UIFont.systemFont(ofSize: 14)
		captionLabel.text = "Your application bank number one"
		
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		titleLabel.textAlignment = .center
		titleLabel.numberOfLines = 0
		titleLabel.textColor = .black
		titleLabel.font = UIFont.boldSystemFont(ofSize: 21)
		titleLabel.text = "Bankey"
		
	}
	
	@objc func signInButtonTapped() {
		errorMessageLabel.isHidden = true
		signInButton.configuration?.showsActivityIndicator = true
		
		guard let username = username, let password = password else {
			return
		}
		
		if username.isEmpty || password.isEmpty {
			DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
				self.signInButton.configuration?.showsActivityIndicator = false
			}
			errorMessageLabel.isHidden = false
			errorMessageLabel.text = "Username/password can not be blank"
		}
		else if username == "idris" && password == "welcome" {
			
		}
		else {
			DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
				self.signInButton.configuration?.showsActivityIndicator = false
			}
			errorMessageLabel.isHidden = false
			errorMessageLabel.text = "Username/password are invalid"
		}
	}
	
	private func layout() {
		view.addSubview(loginView)
		view.addSubview(signInButton)
		view.addSubview(errorMessageLabel)
		view.addSubview(titleLabel)
		view.addSubview(captionLabel)
		  
		NSLayoutConstraint.activate([
			loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
			view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
		])
		
		NSLayoutConstraint.activate([
			signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
			signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
			signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
			signInButton.heightAnchor.constraint(equalToConstant: 48)
		])
		
		NSLayoutConstraint.activate([
			errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
			errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
			errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
		])
		
		NSLayoutConstraint.activate([
			loginView.topAnchor.constraint(equalToSystemSpacingBelow: captionLabel.bottomAnchor, multiplier: 3),
			captionLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
			captionLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
		])
		
		NSLayoutConstraint.activate([
			captionLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 1),
			titleLabel.leadingAnchor.constraint(equalTo: captionLabel.leadingAnchor),
			titleLabel.trailingAnchor.constraint(equalTo: captionLabel.trailingAnchor),
		])
	}
}
