//
//  ViewController.swift
//  HW_01p1
//
//  Created by Andrey Zavershinskiy on 14.11.2023.
//
// MARK: - The first controller to display authorization via VK

import UIKit
import WebKit

class ViewController: UIViewController {

	private lazy var webView: WKWebView = {
		let webView = WKWebView(frame: view.bounds)
		webView.navigationDelegate = self
		return webView
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		let url = URL(string: "https://oauth.vk.com/authorize?client_id=51805768&redirect_uri=https://oauth.vk.com/blank.html&display=mobile&scope=262150&response_type=token")
		webView.load(URLRequest(url: url!))
		setupViews()
	}

	private func setupViews() {
		view.addSubview(webView)
	}

	// MARK: - Setting up transition after authorization to the following tabs: Friends, Groups, Photos
	private func tap() {
		let tabFriends = UINavigationController(rootViewController: FriendsViewController())
		tabFriends.tabBarItem.title = "Friends"

		let tabGroups = UINavigationController(rootViewController: GroupsViewController())
		tabGroups.tabBarItem.title = "Groups"

		let tabPhotos = UINavigationController(rootViewController: PhotosViewController(
			collectionViewLayout: UICollectionViewFlowLayout()))
		tabPhotos.tabBarItem.title = "Photos"

		let tabs = [tabFriends, tabGroups, tabPhotos]

		let tabController = UITabBarController()
		tabController.viewControllers = tabs
		goTabController()

		// MARK: Tabbed navigation method
		func goTabController() {
			navigationController?.pushViewController(tabController, animated: true)
			navigationController?.isNavigationBarHidden = true
		}
	}
}

// MARK: - Extension for authorization using user token
extension ViewController: WKNavigationDelegate {
	func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
		guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment else {
			decisionHandler(.allow)
			return
		}
		let params = fragment.components(separatedBy: "&").map { $0.components(separatedBy: "=" ) }.reduce([String: String]()) { result, param in
			var dict = result
			let key = param[0]
			let value = param[1]
			dict[key] = value
			return dict
		}
		NetworkService.token = params["access_token"]!
		//		print(NetworkService.token)
		decisionHandler(.cancel)
		webView.removeFromSuperview()
		tap()
	}
}
