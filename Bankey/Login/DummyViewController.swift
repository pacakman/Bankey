//
//  DummyViewController.swift
//  Bankey
//
//  Created by Idris on 16/05/22.
//

import UIKit
protocol LogoutDelegate: AnyObject {
	func didLogout()
}

class DummyViewController: UIViewController {
	let stackView: UIStackView = {
		let s = UIStackView()
		s.translatesAutoresizingMaskIntoConstraints = false
		s.axis = .vertical
		s.spacing = 20
		
		return s
	}()
	
	let label: UILabel = {
		let l = UILabel()
		l.translatesAutoresizingMaskIntoConstraints = false
		l.text = "Welcome"
		l.font = UIFont.preferredFont(forTextStyle: .title1)
		
		return l
	}()
	
	let logoutButton: UIButton = {
		let b = UIButton(type: .system)
		b.translatesAutoresizingMaskIntoConstraints = false
		b.configuration = .filled()
		b.setTitle("Sign Out", for: [])
		return b
	}()
	
	weak var delegate: LogoutDelegate?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .primaryActionTriggered)
		
		layout()
	}
	
	@objc private func logoutButtonTapped() {
		delegate?.didLogout()
	}
	
	private func layout() {
		view.addSubview(stackView)
		stackView.addArrangedSubview(label)
		stackView.addArrangedSubview(logoutButton)
		
		NSLayoutConstraint.activate([
			stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
		])
		
		NSLayoutConstraint.activate([
			logoutButton.heightAnchor.constraint(equalToConstant: 38),
		])
	}
}
