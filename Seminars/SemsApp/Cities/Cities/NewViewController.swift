//
//  NewViewController.swift
//  Cities
//
//  Created by Daniil Rassadin on 13/11/23.
//

import UIKit

final class NewViewController: UIViewController {
    
    private let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    private let blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    private let grayView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    private let blackView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private let yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    private let purpleView: UIView = {
        let view = UIView()
        view.backgroundColor = .purple
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        title = "Next ViewController"
        
        setupView()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = Theme.currentTheme.backgroundColor
    }
    
    private func setupView() {
        view.addSubview(redView)
        view.addSubview(blueView)
        view.addSubview(grayView)
        view.addSubview(blackView)
        view.addSubview(yellowView)
        view.addSubview(purpleView)
    }
    
    private func setupConstraints() {
        redView.translatesAutoresizingMaskIntoConstraints = false
        blueView.translatesAutoresizingMaskIntoConstraints = false
        grayView.translatesAutoresizingMaskIntoConstraints = false
        blackView.translatesAutoresizingMaskIntoConstraints = false
        yellowView.translatesAutoresizingMaskIntoConstraints = false
        purpleView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            redView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            redView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            redView.heightAnchor.constraint(equalToConstant: view.frame.size.height / 7),
            redView.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -5),
            
            blueView.topAnchor.constraint(equalTo: redView.topAnchor),
            blueView.heightAnchor.constraint(equalTo: redView.heightAnchor),
            blueView.widthAnchor.constraint(equalTo: redView.widthAnchor),
            blueView.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 5),
            
            grayView.topAnchor.constraint(equalTo: redView.bottomAnchor, constant: 10),
            grayView.heightAnchor.constraint(equalTo: redView.heightAnchor),
            grayView.widthAnchor.constraint(equalTo: redView.widthAnchor),
            grayView.leadingAnchor.constraint(equalTo: redView.leadingAnchor),
            
            blackView.topAnchor.constraint(equalTo: grayView.topAnchor),
            blackView.heightAnchor.constraint(equalTo: redView.heightAnchor),
            blackView.widthAnchor.constraint(equalTo: redView.widthAnchor),
            blackView.leadingAnchor.constraint(equalTo: blueView.leadingAnchor),
            
            yellowView.topAnchor.constraint(equalTo: grayView.bottomAnchor, constant: 10),
            yellowView.heightAnchor.constraint(equalTo: redView.heightAnchor),
            yellowView.widthAnchor.constraint(equalTo: redView.widthAnchor),
            yellowView.leadingAnchor.constraint(equalTo: redView.leadingAnchor),
            
            purpleView.topAnchor.constraint(equalTo: yellowView.topAnchor),
            purpleView.heightAnchor.constraint(equalTo: redView.heightAnchor),
            purpleView.widthAnchor.constraint(equalTo: redView.widthAnchor),
            purpleView.leadingAnchor.constraint(equalTo: blueView.leadingAnchor)
        ])
    }

}

#Preview {
    NewViewController()
}
