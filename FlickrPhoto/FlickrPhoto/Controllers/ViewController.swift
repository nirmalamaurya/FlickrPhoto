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
    private let serviceManger = ServiceManger()
    private var viewModel: ViewModel?
    private let layout = UICollectionViewFlowLayout()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "FlickrPhoto"
        setupCollectionView()
        setUpViewModel()
    }
    
    func setUpViewModel(){
        viewModel = ViewModel(navigator: NavigationViewController(), dataReceiver: DataReceiverViewModel(dataSource: serviceManger), displayer: self)
        viewModel?.start()
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

extension ViewController :Displayer{
    func updateView(with dataState: DataState) {
        collectionView.isHidden = true
    }
    
    func updateView(with viewState: PhotoViewState) {
        collectionView.isHidden = false
       viewControllerHelperAdaptor.update(with: viewState)
        collectionView.reloadData()
    }
    
    func updateView(with error: Error) {
        collectionView.isHidden = true
    }
}


