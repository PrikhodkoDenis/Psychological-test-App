//
//  ImageView.swift
//  Psychological test App
//
//  Created by Denis on 26.02.2022.
//

import UIKit

class ImageView: UIImageView {
    
    let type: ImageViewType
    
    init(type: ImageViewType) {
        self.type = type
        super.init(frame: .zero)
        configureImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ImageView {
    
    func configureImageView() {
        switch type {
        case .start:
            image = UIImage(named: "2")
        case .finish:
            image = UIImage(named: "3")
        }
        
        layer.cornerRadius = 25
        clipsToBounds = true
        contentMode = .scaleToFill
        setContentCompressionResistancePriority(UILayoutPriority(749), for: .vertical)
    }
}
