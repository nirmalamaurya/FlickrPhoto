//
//  StoryBoard.swift
//  FlickrPhoto
//
//  Created by Nirmala on 14/6/21.
//

import UIKit

protocol StoryBoardManager {
    
  static func instantiateViewController() -> Self
    
}


extension StoryBoardManager where Self : UIViewController{
    
   static func instantiateViewController() -> Self {
        
    let identifier = String(describing: Self())
    print(identifier)
    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
    return storyBoard.instantiateViewController(identifier: identifier)
    }
}

