//
//  AppDelegate.swift
//  Bankey
//O
//  Created by Idris on 09/04/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
	var window: UIWindow?
	let loginViewController: LoginViewController = LoginViewController()
	let onboardingContainerViewController: OnboardingContainerViewController = OnboardingContainerViewController()
	let dummyViewController: DummyViewController = DummyViewController()
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
		window = UIWindow(frame: UIScreen.main.bounds)
		
		window?.backgroundColor = .systemBackground
		loginViewController.delegate = self
		onboardingContainerViewController.delegate = self
		dummyViewController.delegate = self
		setRootViewController(loginViewController, animated: false)
		return true
	}
	
	private func setRootViewController(_ vc: UIViewController, animated: Bool = true) {
		guard animated, let window = self.window else {
			window?.rootViewController = vc
			window?.makeKeyAndVisible()
			return
		}
		
		window.rootViewController = vc
		window.makeKeyAndVisible()
		
		UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: nil, completion: nil)
	}
}

extension AppDelegate: LoginViewControllerDelegate, OnboardingContainerViewControllerDelegate, LogoutDelegate {
	func didLogin() {
		if LocalState.hasOnboarded {
			setRootViewController(dummyViewController)
		}
		else {
			setRootViewController(onboardingContainerViewController)
		}
	}
	
	func didFinishOnboarding() {
		LocalState.hasOnboarded = true
		setRootViewController(dummyViewController)
	}
	
	func didLogout() {
		setRootViewController(loginViewController)
	}
}
