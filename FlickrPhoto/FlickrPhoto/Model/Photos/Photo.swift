//
//  Photo.swift
//  FlickrPhoto
//
//  Created by Nirmala on 14/6/21.
//

import Foundation

extension Photo {
    func makeImageUrl() -> URL? {
        let urlString = "http://farm" + String(self.farm) + ".static.flickr.com/" + String(self.server) + "/" + String(self.id) + "_" + String(self.secret) + ".jpg"
        return URL(string: urlString)
    }
}


struct Photo: Codable {
    var id: String
    var owner: String
    var secret: String
    var server: String
    var  farm: Int
    var title: String
    var ispublic: Int
    var isfriend: Int
    var isfamily: Int
}
