//
//  NewViewController.swift
//  CreateApp
//
//  Created by Анастасия Рябова on 24.04.2023.
//

import Foundation
import UIKit

class NewViewController: UIViewController {
    
    private var view1: UIView = {
        let firstView = UIView()
        firstView.backgroundColor =  .red
        return firstView
    }()
    
    private var view2: UIView = {
        let firstView = UIView()
        firstView.backgroundColor =  .blue
        return firstView
    }()
    
    private var view3: UIView = {
        let firstView = UIView()
        firstView.backgroundColor =  .gray
        return firstView
    }()
    
    private var view4: UIView = {
        let firstView = UIView()
        firstView.backgroundColor =  .black
        return firstView
    }()
    
    private var view5: UIView = {
        let firstView = UIView()
        firstView.backgroundColor =  .yellow
        return firstView
    }()
    
    private var view6: UIView = {
        let firstView = UIView()
        firstView.backgroundColor =  .purple
        return firstView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        title = "Next ViewController"
        setupViews()
    }
    
    private func setupViews() {
        view.addSubview(view1)
        view.addSubview(view2)
        view.addSubview(view3)
        view.addSubview(view4)
        view.addSubview(view5)
        view.addSubview(view6)
        setupConstraints()
    }
    
    private func setupConstraints() {
        view1.translatesAutoresizingMaskIntoConstraints = false
        view2.translatesAutoresizingMaskIntoConstraints = false
        view3.translatesAutoresizingMaskIntoConstraints = false
        view4.translatesAutoresizingMaskIntoConstraints = false
        view5.translatesAutoresizingMaskIntoConstraints = false
        view6.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            view1.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -5),
            view1.heightAnchor.constraint(equalToConstant: view.frame.size.width/3),
            view1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            view2.topAnchor.constraint(equalTo: view1.topAnchor),
            view2.widthAnchor.constraint(equalTo: view1.widthAnchor),
            view2.heightAnchor.constraint(equalTo: view1.heightAnchor),
            view2.leadingAnchor.constraint(equalTo: view1.trailingAnchor, constant: 5),
            
            view3.topAnchor.constraint(equalTo: view1.bottomAnchor, constant: 10),
            view3.widthAnchor.constraint(equalTo: view1.widthAnchor),
            view3.heightAnchor.constraint(equalTo: view1.heightAnchor),
            view3.leadingAnchor.constraint(equalTo: view1.leadingAnchor),
            
            view4.topAnchor.constraint(equalTo: view3.topAnchor),
            view4.widthAnchor.constraint(equalTo: view1.widthAnchor),
            view4.heightAnchor.constraint(equalTo: view1.heightAnchor),
            view4.leadingAnchor.constraint(equalTo: view3.trailingAnchor, constant: 5),
            
            view5.topAnchor.constraint(equalTo: view3.bottomAnchor, constant: 10),
            view5.widthAnchor.constraint(equalTo: view1.widthAnchor),
            view5.heightAnchor.constraint(equalTo: view1.heightAnchor),
            view5.leadingAnchor.constraint(equalTo: view1.leadingAnchor),
            
            view6.topAnchor.constraint(equalTo: view5.topAnchor),
            view6.widthAnchor.constraint(equalTo: view1.widthAnchor),
            view6.heightAnchor.constraint(equalTo: view1.heightAnchor),
            view6.leadingAnchor.constraint(equalTo: view5.trailingAnchor, constant: 5),
            
        ])
    }
}
