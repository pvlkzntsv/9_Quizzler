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
    
    private lazy var trueButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        var config = UIButton.Configuration.filled()
        config.background.backgroundColor = .clear
        config.title = "True"
        //        config.background.image = UIImage(imageLiteralResourceName: "Rectangle")
        config.background.strokeColor = .gray
        config.background.strokeWidth = 2
        config.cornerStyle = .large
        config.buttonSize = .large
        config.baseForegroundColor = .white
        config.setDefaultContentInsets()
        button.configuration = config
        button.addAction(UIAction { _ in self.answerButtonPressed(button)}, for: .touchUpInside)
        return button
    }()
    
    
    private lazy var falseButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        var config = UIButton.Configuration.filled()
        config.background.backgroundColor = .clear
        config.title = "False"
        //        config.background.image = UIImage(imageLiteralResourceName: "Rectangle")
        config.background.strokeColor = .gray
        config.background.strokeWidth = 2
        config.cornerStyle = .large
        config.buttonSize = .large
        config.setDefaultContentInsets()
        config.baseForegroundColor = .white
        button.configuration = config
        button.addAction(UIAction { _ in self.answerButtonPressed(button)}, for: .touchUpInside)
        return button
    }()
    
    private var progressBarView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.trackTintColor = .clear
        progressView.progressTintColor = .purple
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
            questionLabel.heightAnchor.constraint(equalTo: contentStackView.heightAnchor, multiplier: 0.70),
            trueButton.heightAnchor.constraint(equalTo: contentStackView.heightAnchor, multiplier: 0.10),
            falseButton.heightAnchor.constraint(equalTo: contentStackView.heightAnchor, multiplier: 0.10),
            progressBarView.heightAnchor.constraint(equalTo: contentStackView.heightAnchor, multiplier: 0.02),
            
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
    
    @objc func updateUI() {
        questionLabel.text = quizzBrain.getQuestionText()
        progressBarView.progress =  quizzBrain.getProgress()
        trueButton.backgroundColor = .clear
        falseButton.backgroundColor = .clear
    }
    
    @objc func answerButtonPressed(_ sender: UIButton){
        guard let title = sender.titleLabel?.text! else { return }
        
        let answerIsCorrect = quizzBrain.checkAnswer(title)
        
        if answerIsCorrect {
            sender.backgroundColor = .green
        }else {
            sender.backgroundColor = .red
        }
        
        quizzBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
}
