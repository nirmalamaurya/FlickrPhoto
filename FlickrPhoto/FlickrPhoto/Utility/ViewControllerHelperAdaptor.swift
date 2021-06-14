//
//  ViewControllerHelperAdaptor.swift
//  FlickrPhoto
//
//  Created by Nirmala on 14/6/21.
//

import UIKit

let cellIdentifier = "PhotoCollectionViewCell"

class ViewControllerHelperAdaptor : NSObject{
    
    private let spacing: CGFloat = 3

    
    func registerCells(with collectionView: UICollectionView) {
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
    }
    
    
    private func cellSize(width  : CGFloat) -> CGSize {
        let height = width/3 - (spacing * 2)
        return CGSize(width: width, height: height)
    }
    
}

extension ViewControllerHelperAdaptor : UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 5
    }
  
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? PhotoCollectionViewCell{
            return cell
        }
        
        return PhotoCollectionViewCell()
        
    }
}
extension ViewControllerHelperAdaptor : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width/3 - (spacing * 2)
        let size = cellSize(width: width)
        return size
    }
}
