//
//  CoordinatorManager.swift
//  FlickrPhoto
//
//  Created by Nirmala on 14/6/21.
//

import UIKit

protocol CoordinatorManager {
    
    func start(inWindow mainWindow: UIWindow?)
}

class RootCoordintor  {
    
    private var navigationManager : NavigationManager
    private var window: UIWindow?
    
    init(navigationManager:NavigationManager) {
        self.navigationManager = navigationManager
    }
}

extension RootCoordintor : CoordinatorManager{
    func start(inWindow mainWindow: UIWindow?) {
        window = mainWindow
        window?.rootViewController = navigationManager.navigationController
        window?.makeKeyAndVisible()
    }
    
    
}
