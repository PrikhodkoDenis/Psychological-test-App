//
//  TextInfo.swift
//  Psychological test App
//
//  Created by Denis on 25.02.2022.
//

import UIKit

enum Text: String {
    
    static var attributes: [NSAttributedString.Key: NSObject] {
        let descriptor = UIFontDescriptor(name: "Avenir-BlackOblique", size: 18)
        let font = UIFont(descriptor: descriptor, size: 18)
        
        let textShadow = NSShadow()
        textShadow.shadowColor = UIColor.black
        textShadow.shadowOffset = .init(width: 3, height: 3)
        
        let attributes = [
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.shadow: textShadow
        ]
        
        return attributes
    }
    
    case startInfo = """
    Саморазвитие – это постоянная работа над собой, самосовершенствование и выработка личных качеств. В этом процессе человек концентрируется на своих собственных желаниях и целях и постоянно добывает все новые и новые знания для их достижения. Этот процесс является основным для достижения жизненного успеха. Пройдите тест и узнайте уровень вашего саморазвития.
    """
    case question = "Согласны ли вы с данным утверждением?"
    case firstResult = "Вы активно реализуете свои потребности в саморазвитии."
    case secondResult = "У вас отсутствует сложившаяся система саморазвития."
    case thirdResult = "Cаморазвитие на данный момент остановилось."
}
