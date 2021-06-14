//
//  NavigationManager.swift
//  FlickrPhoto
//
//  Created by Nirmala on 14/6/21.
//

import UIKit

protocol NavigationManager {
    
    var navigationController : UINavigationController{get}
}

struct NavigationViewController : NavigationManager {
    
    var navigationController: UINavigationController{
        
        let stroryboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = stroryboard.instantiateViewController(identifier: "ViewController")
        let navController = UINavigationController(rootViewController: viewController)
        return navController
    }
}
