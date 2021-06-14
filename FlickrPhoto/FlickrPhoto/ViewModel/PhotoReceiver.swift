//
//  PhotoProvide.swift
//  FlickrPhoto
//
//  Created by Nirmala on 14/6/21.
//

import Foundation




protocol DataReceivable {
    func getPhotos(successHandler: @escaping successHandler, errorHandler: @escaping errorHandler)
}

struct DataReceiverViewModel : DataReceivable {
    
    private let dataSource: ServiceManagerDataSource
    
    init(dataSource: ServiceManagerDataSource) {
        self.dataSource = dataSource
    }
    func getPhotos(successHandler: @escaping successHandler, errorHandler: @escaping errorHandler) {
        
        dataSource.loadContent { photos in
            successHandler(photos)
        } errorHandler: { error in
            errorHandler(error)
        }

        
    }
    
}
