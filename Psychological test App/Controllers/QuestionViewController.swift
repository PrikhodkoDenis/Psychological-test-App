//
//  QuestionViewController.swift
//  Psychological test App
//
//  Created by Denis on 23.02.2022.
//

import UIKit

class QuestionViewController: UIViewController {
    
    var resultCounter = 0
    
    private let progressView = UIProgressView()
    private let questionLabel = LabelView(type: .question)
    private let statementLabel = LabelView(type: .statement)
    private let answerButton5 = ButtonView(type: .answer5)
    private let answerButton4 = ButtonView(type: .answer4)
    private let answerButton3 = ButtonView(type: .answer3)
    private let answerButton2 = ButtonView(type: .answer2)
    private let answerButton1 = ButtonView(type: .answer1)
    
    private let statementsCount = Float(Statement.allCases.count)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureSubviews()
        makeConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(progressView)
        view.addSubview(questionLabel)
        view.addSubview(statementLabel)
        view.addSubview(answerButton5)
        view.addSubview(answerButton4)
        view.addSubview(answerButton3)
        view.addSubview(answerButton2)
        view.addSubview(answerButton1)
    }
    
    private func configureSubviews() {
        
        [answerButton5, answerButton4, answerButton3, answerButton2, answerButton1]
            .forEach {
                $0.addTarget(self, action: #selector(answerButtonPressed), for: .touchUpInside)
                $0.addTarget(self, action: #selector(animateButton), for: .touchDown)
                $0.addTarget(self, action: #selector(fixAnimationBug), for: .touchUpOutside)
            }
        
        answerButton5.tag = 5
        answerButton4.tag = 4
        answerButton3.tag = 3
        answerButton2.tag = 2
        answerButton1.tag = 1
        
        navigationItem.title = "Тест"
        progressView.progress = 0.0
        progressView.progressTintColor = .red
        view.backgroundColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
    }
    
    private func makeConstraints() {
        [progressView,
         statementLabel,
         questionLabel,
         answerButton5,
         answerButton4,
         answerButton3,
         answerButton2,
         answerButton1]
            .forEach {
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
        
        NSLayoutConstraint.activate([
            progressView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            progressView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            progressView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            
            questionLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10),
            questionLabel.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 10),
            questionLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10),
            
            statementLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10),
            statementLabel.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 10),
            statementLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10),
            
            answerButton5.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10),
            answerButton5.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10),
            
            answerButton4.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10),
            answerButton4.topAnchor.constraint(equalTo: answerButton5.bottomAnchor, constant: 10),
            answerButton4.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10),
            
            answerButton3.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10),
            answerButton3.topAnchor.constraint(equalTo: answerButton4.bottomAnchor, constant: 10),
            answerButton3.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10),
            
            answerButton2.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10),
            answerButton2.topAnchor.constraint(equalTo: answerButton3.bottomAnchor, constant: 10),
            answerButton2.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10),
            
            answerButton1.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10),
            answerButton1.topAnchor.constraint(equalTo: answerButton2.bottomAnchor, constant: 10),
            answerButton1.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10),
            answerButton1.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
}

extension QuestionViewController {
    
    @objc func answerButtonPressed(button: UIButton) {
        
        resultCounter += button.tag
        button.backgroundColor = .black
        
        switch statementLabel.text {
        case Statement.one.rawValue:
            statementLabel.text = Statement.two.rawValue
            progressView.progress = 1 / statementsCount
        case Statement.two.rawValue:
            statementLabel.text = Statement.three.rawValue
            progressView.progress = 2 / statementsCount
        case Statement.three.rawValue:
            statementLabel.text = Statement.four.rawValue
            progressView.progress = 3 / statementsCount
        case Statement.four.rawValue:
            statementLabel.text = Statement.five.rawValue
            progressView.progress = 4 / statementsCount
        case Statement.five.rawValue:
            statementLabel.text = Statement.six.rawValue
            progressView.progress = 5 / statementsCount
        case Statement.six.rawValue:
            statementLabel.text = Statement.seven.rawValue
            progressView.progress = 6 / statementsCount
        case Statement.seven.rawValue:
            statementLabel.text = Statement.eight.rawValue
            progressView.progress = 7 / statementsCount
        case Statement.eight.rawValue:
            statementLabel.text = Statement.nine.rawValue
            progressView.progress = 8 / statementsCount
        case Statement.nine.rawValue:
            statementLabel.text = Statement.ten.rawValue
            progressView.progress = 9 / statementsCount
        case Statement.ten.rawValue:
            statementLabel.text = Statement.eleven.rawValue
            progressView.progress = 10 / statementsCount
        case Statement.eleven.rawValue:
            statementLabel.text = Statement.twelve.rawValue
            progressView.progress = 11 / statementsCount
        case Statement.twelve.rawValue:
            statementLabel.text = Statement.thirdteen.rawValue
            progressView.progress = 12 / statementsCount
        case Statement.thirdteen.rawValue:
            statementLabel.text = Statement.fourteen.rawValue
            progressView.progress = 13 / statementsCount
        case Statement.fourteen.rawValue:
            statementLabel.text = Statement.fifteen.rawValue
            progressView.progress = 14 / statementsCount
        case Statement.fifteen.rawValue:
            goToResultScreen()
            progressView.progress = 15 / statementsCount
        default:
            break
        }
    }
    
    private func goToResultScreen() {
        let resultVC = ResultViewController()
        resultVC.resultOfTheTest = resultCounter
        navigationController?.pushViewController(resultVC, animated: true)
    }
    
    @objc func animateButton(button: UIButton) {
        button.backgroundColor = .red
    }
    
    @objc func fixAnimationBug(button: UIButton) {
        button.backgroundColor = .black
    }
}
