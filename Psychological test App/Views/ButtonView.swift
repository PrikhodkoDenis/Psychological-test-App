//
//  Button.swift
//  Psychological test App
//
//  Created by Denis on 26.02.2022.
//

import UIKit

class ButtonView: UIButton {
    
    let type: MyButtonType
    
    init(type: MyButtonType) {
        self.type = type
        super.init(frame: .zero)
        configureButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ButtonView {
    
    func configureButton() {
        let startAttributed = NSAttributedString(string: MyButtonType.start.rawValue, attributes: Text.attributes)
        let answer5Attributed = NSAttributedString(string: MyButtonType.answer5.rawValue, attributes: Text.attributes)
        let answer4Attributed = NSAttributedString(string: MyButtonType.answer4.rawValue, attributes: Text.attributes)
        let answer3Attributed = NSAttributedString(string: MyButtonType.answer3.rawValue, attributes: Text.attributes)
        let answer2Attributed = NSAttributedString(string: MyButtonType.answer2.rawValue, attributes: Text.attributes)
        let answer1Attributed = NSAttributedString(string: MyButtonType.answer1.rawValue, attributes: Text.attributes)
        let finishAttributed = NSAttributedString(string: MyButtonType.finish.rawValue, attributes: Text.attributes)
        
        switch type {
        case .start:
            setAttributedTitle(startAttributed, for: .normal)
        case .answer5:
            setAttributedTitle(answer5Attributed, for: .normal)
        case .answer4:
            setAttributedTitle(answer4Attributed, for: .normal)
        case .answer3:
            setAttributedTitle(answer3Attributed, for: .normal)
        case .answer2:
            setAttributedTitle(answer2Attributed, for: .normal)
        case .answer1:
            setAttributedTitle(answer1Attributed, for: .normal)
        case .finish:
            setAttributedTitle(finishAttributed, for: .normal)
        }
        
        backgroundColor = .black
        layer.cornerRadius = 15
    }
}
