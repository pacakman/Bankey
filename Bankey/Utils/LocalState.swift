//
//  LocalState.swift
//  Bankey
//
//  Created by Idris on 21/05/22.
//

import Foundation

class LocalState {
	private enum Keys: String {
		case hasOnboarded
	}
	
	public static var hasOnboarded: Bool {
		get {
			return UserDefaults.standard.bool(forKey: Keys.hasOnboarded.rawValue)
		}
		set(newValue) {
			UserDefaults.standard.set(newValue, forKey: Keys.hasOnboarded.rawValue)
			UserDefaults.standard.synchronize()
		}
	}
}
