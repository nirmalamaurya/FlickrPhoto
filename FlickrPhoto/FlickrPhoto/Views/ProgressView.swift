//
//  ProgressView.swift
//  FlickrPhoto
//
//  Created by Nirmala on 15/6/21.
//

import Foundation

import UIKit

class ProgressView: UIView {

    let activityIndicator = UIActivityIndicatorView(style: .large)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .darkGray
        self.alpha = 0.5
        setUpView()
    }
    
    func setUpView() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.color = .white
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        self.addSubview(activityIndicator)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        let horizontalConstraint = activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let verticalConstraint = activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        let widthConstraint = activityIndicator.widthAnchor.constraint(equalTo: self.widthAnchor, constant: 20)
        let heightConstraint = activityIndicator.heightAnchor.constraint(equalTo: self.heightAnchor, constant: 20)
        self.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
    }
}
