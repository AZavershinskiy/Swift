//
//  SceneDelegate.swift
//  HW_01p1
//
//  Created by Andrey Zavershinskiy on 14.11.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		guard let scene = (scene as? UIWindowScene) else { return }
		let navigationController = UINavigationController(rootViewController: ViewController())
		window = UIWindow(windowScene: scene)
		window?.rootViewController = navigationController
		window?.makeKeyAndVisible()
	}
}
