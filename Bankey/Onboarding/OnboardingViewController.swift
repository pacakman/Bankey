//
//  OnboardingViewController.swift
//  Bankey
//
//  Created by Idris on 14/05/22.
//

import UIKit

class OnboardingViewController: UIViewController {
	let stackView = UIStackView()
	let imageView = UIImageView()
	let label = UILabel()
	
	var onboardingTitle: String
	
	init(onboardingTitle: String) {
		self.onboardingTitle = onboardingTitle
		
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		style()
		layout()
    }
    
	private func style() {
		view.backgroundColor = .systemBackground
		// stackview
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.axis = .vertical
		stackView.spacing = 20
		
		// image
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFit
		imageView.image = UIImage(systemName: "camera.fill")
		
		// label
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = onboardingTitle
		label.font = UIFont.preferredFont(forTextStyle: .title3)
		label.adjustsFontForContentSizeCategory = true
		label.numberOfLines = 0
		label.textAlignment = .center
		
	}
	
	private func layout() {
		stackView.addArrangedSubview(imageView)
		stackView.addArrangedSubview(label)
		view.addSubview(stackView)
		NSLayoutConstraint.activate([
			stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
			view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1)
		])
		
		NSLayoutConstraint.activate([
			imageView.heightAnchor.constraint(equalToConstant: 150)
		])
	}
}
