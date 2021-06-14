//
//  PhotoCollectionViewCell.swift
//  FlickrPhoto
//
//  Created by Nirmala on 14/6/21.
//

import UIKit
import SDWebImage

class PhotoCollectionViewCell:UICollectionViewCell{
    
    private let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        cellSetUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func cellSetUp(){
        imageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        self.addSubview(imageView)
        self.SetUpConstraint()
        
    }
    
    func setImageUrl(url: URL) {
        let image = UIImage(named: "placeholder")
        imageView.sd_setImage(with: url, placeholderImage: image)
    }
    
    private func SetUpConstraint(){
        
        let leadingConstraint = imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0.0)
        let trailingConstraint = imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 5.0)
        let top = imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5.0)
        let bottom = imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        self.addConstraints([leadingConstraint, trailingConstraint, top, bottom])
    }
}
