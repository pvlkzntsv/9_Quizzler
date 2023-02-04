//
//  ViewController.swift
//  9_Quizzler
//
//  Created by pvl kzntsv on 31.01.2023.
//

import UIKit


class ViewController: UIViewController {
    
    var quizzBrain = QuizBrain()
    
    //MARK: Elements
    
    private let imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "Background-Bubbles")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let scoreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica", size: 10)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let contentStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis  = .vertical
        //        stack.alignment = .fill
        //        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 5
        return stack
    }()
    
    private var questionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "You really want to play the game"
        label.font = UIFont(name: "Helvetica", size: 30)
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.numberOfLines = 0
        return label
    }()
    
    private let trueButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        var config = UIButton.Configuration.plain()
        config.background.backgroundColor = .clear
        config.title = "True"
        //        config.background.image = UIImage(imageLiteralResourceName: "Rectangle")
        config.background.strokeColor = .gray
        config.background.strokeWidth = 3
        config.cornerStyle = .large
        config.baseForegroundColor = .white
        button.configuration = config
        
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
                      var outgoing = incoming
            outgoing.font = UIFont(name: "Helvetica", size: 40)
                      return outgoing
                    }
        return button
    }()
    
    
    private let falseButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        var config = UIButton.Configuration.plain()
        config.background.backgroundColor = .clear
        config.title = "False"
        //        config.background.image = UIImage(imageLiteralResourceName: "Rectangle")
        config.background.strokeColor = .gray
        config.background.strokeWidth = 3
        config.cornerStyle = .large
        config.baseForegroundColor = .white
        button.configuration = config
        return button
    }()
    
    private var progressBarView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        //        progressView.backgroundColor = .cyan
        return progressView
    }()
    
    
    
    func setupUI() {
        
        contentStackView.addArrangedSubview(scoreLabel)
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
            
            scoreLabel.heightAnchor.constraint(equalTo: contentStackView.heightAnchor, multiplier: 0.05),
            questionLabel.heightAnchor.constraint(equalTo: contentStackView.heightAnchor, multiplier: 0.60),
            trueButton.heightAnchor.constraint(equalTo: contentStackView.heightAnchor, multiplier: 0.15),
            falseButton.heightAnchor.constraint(equalTo: contentStackView.heightAnchor, multiplier: 0.15),
            progressBarView.heightAnchor.constraint(equalTo: contentStackView.heightAnchor, multiplier: 0.05),
            
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
            
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        view.insertSubview(imageView, at: 0)
        view.addSubview(contentStackView)
        setConstraints()
        
    }
    
    
    func updateUI() {
        questionLabel.text = quizzBrain.getQuestionText()
        
    }
    
}
