//
//  OnboardingContainerViewController.swift
//  Bankey
//
//  Created by jrasmusson on 2021-09-28.
//

import UIKit

class OnboardingContainerViewController: UIViewController {
	
	let pageViewController: UIPageViewController
	var pages = [UIViewController]()
	var currentVC: UIViewController
	let closeButton = UIButton(type: .system)
	let nextButton = UIButton(type: .system)
	
	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
		pages.append(OnboardingViewController(onboardingTitle: "Ini adalah halaman pertama"))
		pages.append(OnboardingViewController(onboardingTitle: "Ini adalah halaman kedua"))
		pages.append(OnboardingViewController(onboardingTitle: "Ini adalah halaman ketiga"))
		currentVC = pages.first!
		
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setup()
		style()
		layout()
	}
	
	private func setup() {
		pageViewController.setViewControllers([pages.first!], direction: .forward, animated: false, completion: nil)
		currentVC = pages.first!
	}
	
	private func layout() {
		NSLayoutConstraint.activate([
			view.topAnchor.constraint(equalTo: pageViewController.view.topAnchor),
			view.leadingAnchor.constraint(equalTo: pageViewController.view.leadingAnchor),
			view.trailingAnchor.constraint(equalTo: pageViewController.view.trailingAnchor),
			view.bottomAnchor.constraint(equalTo: pageViewController.view.bottomAnchor),
		])
		
		NSLayoutConstraint.activate([
			closeButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
			closeButton.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2  )
		])
	}
	
	private func style() {
		view.backgroundColor = .systemPurple
		
		pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
		addChild(pageViewController)
		view.addSubview(pageViewController.view)
		pageViewController.didMove(toParent: self)
		pageViewController.dataSource = self
		
		closeButton.translatesAutoresizingMaskIntoConstraints = false
		closeButton.setTitle("Close", for: [])
		closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .primaryActionTriggered)
		view.addSubview(closeButton)
		
		
	}
	
	@objc private func closeButtonTapped() {
		 
	}
}

// MARK: - UIPageViewControllerDataSource
extension OnboardingContainerViewController: UIPageViewControllerDataSource {
	
	func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
		return getPreviousViewController(from: viewController)
	}
	
	func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
		return getNextViewController(from: viewController)
	}
	
	private func getPreviousViewController(from viewController: UIViewController) -> UIViewController? {
		guard let index = pages.firstIndex(of: viewController), index - 1 >= 0 else { return nil }
		currentVC = pages[index - 1]
		return pages[index - 1]
	}
	
	private func getNextViewController(from viewController: UIViewController) -> UIViewController? {
		guard let index = pages.firstIndex(of: viewController), index + 1 < pages.count else { return nil }
		currentVC = pages[index + 1]
		return pages[index + 1]
	}
	
	func presentationCount(for pageViewController: UIPageViewController) -> Int {
		return pages.count
	}
	
	func presentationIndex(for pageViewController: UIPageViewController) -> Int {
		return pages.firstIndex(of: self.currentVC) ?? 0
	}
}
