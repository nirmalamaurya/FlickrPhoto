//
//  ViewModel.swift
//  FlickrPhoto
//
//  Created by Nirmala on 14/6/21.
//

import Foundation

protocol ViewModelManager {
    func start()
}

struct ErrorViewState {
    let errorMessage: String
    init(error: Error) {
        errorMessage = error.localizedDescription
    }
}

enum DataState {
    case presenting
}

struct PhotoViewState {
    let content: [URL]
}

protocol Displayer: AnyObject {
    func updateView(with dataState: DataState)
    func updateView(with viewState: PhotoViewState)
    func updateView(with error: Error)
}



struct ViewModel : ViewModelManager{
    
    
    let navigator: NavigationManager
    let dataReceiver: DataReceivable
    let state: DataState
    weak var displayer: Displayer?
    
    init(navigator: NavigationManager,
         dataReceiver: DataReceivable,
         state: DataState = .presenting,
         displayer: Displayer) {
        self.navigator = navigator
        self.dataReceiver = dataReceiver
        self.state = state
        self.displayer = displayer
    }
    
    
    func start(){
       
        displayer?.updateView(with: state)
        
        dataReceiver.getPhotos { photos in
            displayer?.updateView(with: photos.transformPhotosToViewState())
        } errorHandler: { error in
            displayer?.updateView(with: error)
        }
    }
}
