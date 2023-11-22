//
//  ViewController.swift
//  HW_01p1
//
//  Created by Andrey Zavershinskiy on 14.11.2023.
//

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
		view.backgroundColor = .blue
		
		setupViews()
		
		let url = URL(string: "https://oauth.vk.com/authorize?client_id=51797989&redirect_uri=https://oauth.vk.com/blank.html&display=mobile&scope=262150&response_type=token")
		webView.load(URLRequest(url: url!))
	}
	
	private func setupViews() {
		view.addSubview(webView)
		//		setupConstraints()
	}
	
	//	private func setupConstraints() {
	//		view1.translatesAutoresizingMaskIntoConstraints = false
	//
	//		NSLayoutConstraint.activate([ view1 ]) }
	
	private func tap() {
		
		let tab = UINavigationController(rootViewController: FriendsViewController())
		tab.tabBarItem.title = "Friends"
		
		let tab2 = UINavigationController(rootViewController: GroupsViewController())
		tab2.tabBarItem.title = "Groups"
		
		let tab3 = UINavigationController(rootViewController: PhotosViewController(
			collectionViewLayout: UICollectionViewFlowLayout()))
		tab3.tabBarItem.title = "Photos"
		
		let tabs = [tab, tab2, tab3]
		
		let tabTabController = UITabBarController()
		tabTabController.viewControllers = tabs
		
		guard let scene1 = UIApplication.shared.connectedScenes.first as? UIWindowScene,
			  let window1 = scene1.windows.first else { return }
		window1.rootViewController = tabTabController
	}
}

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
		//		NetworkService.userID = params["user_id"]!
		decisionHandler(.cancel)
		webView.removeFromSuperview()
		tap()
	}
}



