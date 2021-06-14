//
//  Photos.swift
//  FlickrPhoto
//
//  Created by Nirmala on 14/6/21.
//

import Foundation
extension Photos {
    func transformPhotosToViewState() -> PhotoViewState {
        return PhotoViewState(content: self.photo.map { $0.makeImageUrl() }.compactMap({ $0 }))
    }
}

struct Photos: Codable {
    var page: Int
    var pages: Int
    var perpage: Int
    var total: Int
    var photo: [Photo]
}
