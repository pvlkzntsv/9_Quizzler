//
//  ViewController.swift
//  9_Quizzler
//
//  Created by pvl kzntsv on 31.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Elements
    
    private let contentStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis  = .vertical
//        stack.alignment = .fill
//        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private var questionLabel: UILabel = {
        let label = UILabel()
        label.text = "Some questions"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .yellow
        return label
    }()
    
    private let trueButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .green
        
        return button
    }()
    
    
    private let falseButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        return button
    }()
    
    private var progressBarView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.backgroundColor = .cyan
        return progressView
    }()
    
    
    
    func setupUI() {
        contentStackView.addArrangedSubview(questionLabel)
        contentStackView.addArrangedSubview(trueButton)
        contentStackView.addArrangedSubview(falseButton)
        contentStackView.addArrangedSubview(progressBarView)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            contentStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            contentStackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            contentStackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            contentStackView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor),
            
            questionLabel.heightAnchor.constraint(equalTo: contentStackView.heightAnchor, multiplier: 0.65),
            trueButton.heightAnchor.constraint(equalTo: contentStackView.heightAnchor, multiplier: 0.15),
            falseButton.heightAnchor.constraint(equalTo: contentStackView.heightAnchor, multiplier: 0.15),
            progressBarView.heightAnchor.constraint(equalTo: contentStackView.heightAnchor, multiplier: 0.05)
            
            
            
        
        ])
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        view.addSubview(contentStackView)
        setConstraints()
        
    }


}

