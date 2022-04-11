//
//  StartViewController.swift
//  Psychological test App
//
//  Created by Denis on 23.02.2022.
//

import UIKit

class StartViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let startImageView = ImageView(type: .start)
    private let startLabel = LabelView(type: .start)
    private let startButton = ButtonView(type: .start)
    
    private let offset: CGFloat = 16
    private lazy var width = view.bounds.width - offset * 2
    private lazy var height = startButton.frame.origin.y + startButton.frame.height + offset
    private lazy var labelCoordY = startImageView.frame.origin.y + startImageView.frame.height + offset
    private lazy var buttonCoordY = startLabel.frame.origin.y + startLabel.frame.height + offset
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureSubviews()
        makeConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startButton.backgroundColor = .black
    }
    
    private func addSubviews() {
        scrollView.addSubview(startImageView)
        scrollView.addSubview(startLabel)
        scrollView.addSubview(startButton)
        view.addSubview(scrollView)
    }
    
    private func configureSubviews() {
        startImageView.frame = CGRect(x: offset, y: offset, width: width, height: width)
        startLabel.frame = CGRect(x: offset, y: labelCoordY, width: width, height: width * 1.3)
        startButton.frame = CGRect(x: offset, y: buttonCoordY, width: width, height: width / 8)
        
        scrollView.contentSize = CGSize(width: width, height: height)
        
        startButton.addTarget(self, action: #selector(startTest), for: .touchUpInside)
        startButton.addTarget(self, action: #selector(animateButton), for: .touchDown)
        startButton.addTarget(self, action: #selector(fixAnimationBug), for: .touchUpOutside)
        
        navigationItem.title = "Главная"
        view.backgroundColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
    }
    
    private func makeConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension StartViewController {
    
    @objc func startTest() {
        let questionVC = QuestionViewController()
        questionVC.resultCounter = 0
        navigationController?.pushViewController(questionVC, animated: true)
    }
    
    @objc func animateButton(button: UIButton) {
        button.backgroundColor = .red
    }
    
    @objc func fixAnimationBug(button: UIButton) {
        button.backgroundColor = .black
    }
}
