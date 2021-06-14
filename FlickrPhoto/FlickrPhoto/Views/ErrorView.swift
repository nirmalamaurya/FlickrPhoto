//
//  ErrorView.swift
//  FlickrPhoto
//
//  Created by Nirmala on 14/6/21.
//

import UIKit

class ErrorView: UIView {

    let errorLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .green
        setUpErrorLabel()
    }
    
    func setUpErrorLabel() {
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.text = "There is some Error Please try after some time"
        errorLabel.numberOfLines = 0
        errorLabel.textAlignment = .center
        errorLabel.textColor = .white
        self.addSubview(errorLabel)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        let horizontalConstraint = errorLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let verticalConstraint = errorLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        let leadingConstraint = errorLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20)
        self.addConstraints([horizontalConstraint, verticalConstraint, leadingConstraint])
    }
}
