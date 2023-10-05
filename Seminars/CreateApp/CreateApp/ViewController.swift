//
//  ViewController.swift
//  CreateApp
//
//  Created by Анастасия Рябова on 24.04.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private var label: UILabel = {
        let label = UILabel()
        label.text = "Мое первое приложение!"
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = .blue
        return label
    }()
    
    private var button: UIButton = {
        let button = UIButton()
        button.setTitle("Перейти на новый экран", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.green, for: .highlighted)
        button.backgroundColor = .blue
        return button
    }()
    
    private var button1: UIButton = {
        let button = UIButton()
        button.setTitle("Изменить цвет экрана", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.green, for: .highlighted)
        button.backgroundColor = .blue
        return button
    }()
    
    private var button2: UIButton = {
        let button = UIButton()
        button.setTitle("Перейти на TableViewController", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.green, for: .highlighted)
        button.backgroundColor = .blue
        return button
    }()
    
    private var button3: UIButton = {
        let button = UIButton()
        button.setTitle("Перейти на CollectionViewController", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.green, for: .highlighted)
        button.backgroundColor = .blue
        return button
    }()
    
    private var isTap = false
    
//    private var label = UILabel()
  //  private var button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
        button1.addTarget(self, action: #selector(tap1), for: .touchUpInside)
        button2.addTarget(self, action: #selector(tap2), for: .touchUpInside)
        button3.addTarget(self, action: #selector(tap3), for: .touchUpInside)
        setupViews()
       // makeLabel()
       // makeButton()
    }
    
    private func setupViews() {
        view.addSubview(label)
        view.addSubview(button)
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)
        setupConstraints()
    }
    
    private func setupConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        button1.translatesAutoresizingMaskIntoConstraints = false
        button2.translatesAutoresizingMaskIntoConstraints = false
        button3.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.widthAnchor.constraint(equalToConstant: view.frame.size.width/1.5),
            label.heightAnchor.constraint(equalToConstant: view.frame.size.width/4),
            
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            button1.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20),
            button1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button1.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button1.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 20),
            button2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button2.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button2.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            button3.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 20),
            button3.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button3.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button3.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

//    private func makeLabel() {
//        label.text = "Мое первое приложение!"
//        label.textAlignment = .center
//        label.textColor = .white
//        label.backgroundColor = .blue
//    }
//
//    private func makeButton() {
//        button.setTitle("Перейти на новый экран", for: .normal)
//        button.setTitleColor(.white, for: .normal)
//        button.backgroundColor = .blue
//    }

}

private extension ViewController {
    @objc func tap() {
        navigationController?.pushViewController(NewViewController(), animated: true)
    }
    
    @objc func tap1() {
        isTap.toggle()
        if isTap {
            view.backgroundColor = .yellow
        } else {
            view.backgroundColor = .white
        }
    }
    
    @objc func tap2() {
        navigationController?.pushViewController(TableViewController(), animated: true)
    }
    
    @objc func tap3() {
        let controller = CollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        navigationController?.pushViewController(controller, animated: true)
    }
}
