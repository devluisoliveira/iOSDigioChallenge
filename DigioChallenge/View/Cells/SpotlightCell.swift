//
//  SpotlightCell.swift
//  DigioChallenge
//
//  Created by Luis Eduardo Silva Oliveira on 17/02/22.
//

import UIKit

final class SpotlightCell: UICollectionViewCell {
    
    //MARK: - Properties
        
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        return view
    }()
    
    lazy var spotlightImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 12
        iv.image = UIImage(named: "phoneIcon")
        return iv
    }()
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addShadowAndBorderAndCorner()
        addSubview(containerView)
        containerView.addSubview(spotlightImageView)
        
        containerView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        spotlightImageView.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: containerView.bottomAnchor, right: containerView.rightAnchor, height: 170)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
