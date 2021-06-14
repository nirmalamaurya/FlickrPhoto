//
//  ViewController.swift
//  FlickrPhoto
//
//  Created by Nirmala on 14/6/21.
//

import UIKit

class ViewController: UIViewController , StoryBoardManager {
    
@IBOutlet weak var collectionView: UICollectionView!
private let viewControllerHelperAdaptor = ViewControllerHelperAdaptor()
    private let layout = UICollectionViewFlowLayout()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "FlickrPhoto"
        setupCollectionView()
    }


func setupCollectionView() {
    viewControllerHelperAdaptor.registerCells(with: collectionView)
    collectionView.dataSource = viewControllerHelperAdaptor
    collectionView.delegate = viewControllerHelperAdaptor
    layout.scrollDirection = .vertical
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    collectionView.setCollectionViewLayout(layout, animated: true)
}
}


