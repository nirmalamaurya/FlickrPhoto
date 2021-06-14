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
    private let errorView = ErrorView()
    private let progressView = ProgressView()

    private let layout = UICollectionViewFlowLayout()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "FlickrPhoto"
        setupCollectionView()
        setUpViewModel()
        setupProgressView()
        setupErrorView()
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
    
    func setupErrorView() {
        errorView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(errorView)
        errorView.isHidden = true
        setupErrorViewConstraints()
    }
    
    func setupErrorViewConstraints() {
        let leadingConstraint = errorView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let trailingConstraint = errorView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        let upConstraint = errorView.topAnchor.constraint(equalTo: view.topAnchor)
        let bottomConstraint = errorView.bottomAnchor.constraint(equalTo: view.bottomAnchor)

        view.addConstraints([leadingConstraint, trailingConstraint, upConstraint, bottomConstraint])
    }
    
    func setupProgressView() {
        progressView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(progressView)
        progressView.isHidden = true
        progressViewConstraintsSetup()
    }
    
    func progressViewConstraintsSetup() {
        let leadingConstraint = progressView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let trailingConstraint = progressView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        let upConstraint = progressView.topAnchor.constraint(equalTo: view.topAnchor)
        let bottomConstraint = progressView.bottomAnchor.constraint(equalTo: view.bottomAnchor)

        view.addConstraints([leadingConstraint, trailingConstraint, upConstraint, bottomConstraint])
    }
}

extension ViewController :Displayer{
    func updateView(with dataState: DataState) {
        collectionView.isHidden = true
        progressView.isHidden = false
    }
    
    func updateView(with viewState: PhotoViewState) {
        collectionView.isHidden = false
        progressView.isHidden = true
       viewControllerHelperAdaptor.update(with: viewState)
        collectionView.reloadData()
    }
    
    func updateView(with error: Error) {
        collectionView.isHidden = true
        errorView.isHidden = false
        progressView.isHidden = true
    }
}


