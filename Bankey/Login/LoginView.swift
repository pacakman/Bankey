//
//  LoginView.swift
//  Bankey
//
//  Created by Idris on 09/04/22.
//

import UIKit

class LoginView: UIView {
	let stackView: UIStackView = UIStackView()
	let usernameTextField: UITextField = UITextField()
	let passwordTextField: UITextField = UITextField()
	let dividerView: UIView = UIView()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		style()
		layout()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}


extension LoginView {
	private func style() {
		translatesAutoresizingMaskIntoConstraints = false
		backgroundColor = .secondarySystemBackground
		layer.cornerRadius = 6
		clipsToBounds = true
		
		usernameTextField.translatesAutoresizingMaskIntoConstraints = false
		usernameTextField.placeholder = "Username"
		usernameTextField.delegate = self
		
		passwordTextField.translatesAutoresizingMaskIntoConstraints = false
		passwordTextField.placeholder = "Password"
		passwordTextField.isSecureTextEntry = true
		passwordTextField.delegate = self
		
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.axis = .vertical
		stackView.spacing = 0
		
		
		dividerView.translatesAutoresizingMaskIntoConstraints = false
		dividerView.backgroundColor = .secondarySystemFill
	}
	
	
	private func layout() {
		stackView.addArrangedSubview(usernameTextField)
		stackView.addArrangedSubview(dividerView)
		stackView.addArrangedSubview(passwordTextField)
		addSubview(stackView)
		NSLayoutConstraint.activate([
			stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
			stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
			trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
			bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
		])
		
		dividerView.heightAnchor.constraint(equalToConstant: 1).isActive = true
		passwordTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
		usernameTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
	}
}


extension LoginView: UITextFieldDelegate {
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		usernameTextField.endEditing(true)
		passwordTextField.endEditing(true)
		return true
	}
	
	func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
		return true
	}

	func textFieldDidEndEditing(_ textField: UITextField) {
		
	}
}
