//
//  Label.swift
//  Psychological test App
//
//  Created by Denis on 26.02.2022.
//

import UIKit

class LabelView: UILabel {
    
    let type: LabelType
    
    init(type: LabelType) {
        self.type = type
        super.init(frame: .zero)
        configureLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LabelView {
    
    func configureLabel() {
        switch type {
        case .start:
            attributedText = NSAttributedString.init(string: Text.startInfo.rawValue, attributes: Text.attributes)
        case .question:
            attributedText = NSAttributedString.init(string: Text.question.rawValue, attributes: Text.attributes)
        case .statement:
            attributedText = NSAttributedString.init(string: Statement.one.rawValue, attributes: Text.attributes)
        case .finish:
            attributedText = NSAttributedString.init(string: Text.firstResult.rawValue, attributes: Text.attributes)
        }
        
        lineBreakMode = .byWordWrapping
        numberOfLines = 0
        textAlignment = .center
    }
}
