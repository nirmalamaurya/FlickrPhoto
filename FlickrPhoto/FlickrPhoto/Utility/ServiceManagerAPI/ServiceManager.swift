//
//  ServiceManager.swift
//  FlickrPhoto
//
//  Created by Nirmala on 14/6/21.
//

import Foundation
import Alamofire


let apiKey = "96358825614a5d3b1a1c3fd87fca2b47"
let baseURL = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key="

enum ErrorType: Error {
    case badUrl
    case serverError
    case unreachable
}

typealias errorHandler = (Error) -> ()
typealias successHandler = (Photos) -> ()

protocol ServiceManagerDataSource {
    func loadContent(with successHandler : @escaping successHandler,  errorHandler: @escaping errorHandler)
}

struct ServiceManger : ServiceManagerDataSource {
    
    let connectivity: ConnectionManager
    
    init(connectivity: ConnectionManager = Connectivity()) {
        self.connectivity = connectivity
    }
    
    func loadContent(with successHandler : @escaping successHandler,  errorHandler: @escaping errorHandler){
        
        if connectivity.isConnectedToInternet() {
           getData(with: successHandler, errorHandler: errorHandler)
        } else {
            errorHandler(ErrorType.unreachable)
        }
        
    }
    
    private func getData(with successHandler : @escaping successHandler,  errorHandler: @escaping errorHandler){
        do {
            AF.request(try asURL()).responseData { dataResponse in
                if dataResponse.response?.statusCode == 200 {
                    if let data = dataResponse.data,
                       let response = try? JSONDecoder().decode(ResponseData.self, from: data)  {
                        successHandler(response.photos)
                    }
                } else {
                    errorHandler(ErrorType.serverError)
                }
            }
        } catch {
            errorHandler(ErrorType.badUrl)
        }
        
    }
}
extension ServiceManger: URLConvertible {
    func asURL() throws -> URL {
        return try photoUrl()
    }
    
    func photoUrl(apiKey: String = apiKey,
                  text:String = "kitten",
                  page: Int = 1) throws -> URL {
        let urlString = baseURL + apiKey + "&text=" + text + "&format=json&nojsoncallback=" + String(page)
        guard let url = URL(string: urlString) else {
            throw ErrorType.badUrl
        }
        return url
    }
}

