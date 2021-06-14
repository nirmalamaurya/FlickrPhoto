//
//  ConnectionManager.swift
//  FlickrPhoto
//
//  Created by Nirmala on 14/6/21.
//

import Foundation
import Alamofire

protocol ConnectionManager {
    func isConnectedToInternet() ->Bool
}

struct Connectivity  : ConnectionManager {
    func isConnectedToInternet() ->Bool{
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}
