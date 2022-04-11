//
//  SceneDelegate.swift
//  Psychological test App
//
//  Created by Denis on 23.02.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    private let window = UIWindow(frame: UIScreen.main.bounds)
    private let rootViewController = NavigationViewController()
    private let startViewController = StartViewController()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        rootViewController.addChild(startViewController)
        
        window.windowScene = windowScene
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
}

