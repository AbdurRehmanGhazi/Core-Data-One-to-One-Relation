//
//  ApplicatoinSetup.swift
//  Core Data One to One Relation
//
//  Created by AbdurRehmanNineSol on 07/10/2022.
//

import Foundation
import UIKit

class ApplicationSetup {
    
    static var sceneDelegate: SceneDelegate? {
        get {
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let sceneDelegate = windowScene.delegate as? SceneDelegate else { return nil }
            return sceneDelegate
        }
    }
    
    static var window: UIWindow? {
        get {
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let sceneDelegate = windowScene.delegate as? SceneDelegate else { return nil }
            return sceneDelegate.window
        }
    }
    
    // MARK: - Project Based Functions
    
    class func rootVC() {
        tabbarController()
    }
    
    class func tabbarController() {
        let tabbarController = TabBarVC()
        window?.rootViewController = tabbarController
        window?.makeKeyAndVisible()
    }
}
