//
//  ResultViewController.swift
//  Psychological test App
//
//  Created by Denis on 23.02.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    var resultOfTheTest = 0
    
    private let resultImageView = ImageView(type: .finish)
    private let resultLabel = LabelView(type: .finish)
    private let finishButton = ButtonView(type: .finish)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureSubviews()
        makeConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(resultImageView)
        view.addSubview(resultLabel)
        view.addSubview(finishButton)
    }
    
    private func configureSubviews() {
        switch resultOfTheTest {
        case 55...100:
            resultLabel.attributedText = NSAttributedString(string: Text.firstResult.rawValue, attributes: Text.attributes)
            resultImageView.image = UIImage(named: "3")
        case 36...54:
            resultLabel.attributedText = NSAttributedString(string: Text.secondResult.rawValue, attributes: Text.attributes)
            resultImageView.image = UIImage(named: "4")
        case 0...35:
            resultLabel.attributedText = NSAttributedString(string: Text.thirdResult.rawValue, attributes: Text.attributes)
            resultImageView.image = UIImage(named: "5")
        default:
            break
        }
        
        finishButton.addTarget(self, action: #selector(backToMainScreen), for: .touchUpInside)
        finishButton.addTarget(self, action: #selector(animateButton), for: .touchDown)
        finishButton.addTarget(self, action: #selector(fixAnimationBug), for: .touchUpOutside)
        
        navigationItem.title = "Результат"
        view.backgroundColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
    }
    
    private func makeConstraints() {
        [resultImageView, resultLabel, finishButton]
            .forEach {
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
        
        NSLayoutConstraint.activate([
            resultImageView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16),
            resultImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            resultImageView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16),
            
            resultLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16),
            resultLabel.topAnchor.constraint(equalTo: resultImageView.bottomAnchor, constant: 16),
            resultLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16),
            
            finishButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16),
            finishButton.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 16),
            finishButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16),
            finishButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
}

extension ResultViewController {
    
    @objc func backToMainScreen() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func animateButton(button: UIButton) {
        button.backgroundColor = .red
    }
    
    @objc func fixAnimationBug(button: UIButton) {
        button.backgroundColor = .black
    }
}
