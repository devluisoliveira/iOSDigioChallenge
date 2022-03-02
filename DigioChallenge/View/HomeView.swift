//
//  HomeView.swift
//  DigioChallenge
//
//  Created by Luis Eduardo Silva Oliveira on 22/02/22.
//

import Foundation
import UIKit

final class HomeView: UIView {
    
    //MARK: - Properties
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var iconeImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 8
        iv.image = UIImage(named: "phoneIcon")
        return iv
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Olá, Luis Oliveira"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
    
    lazy var stackView = makeStackView(
        axis: .horizontal,
        distribution: .fill,
        spacing: 10,
        alignment: .center)
    
    lazy var collectionView = makeCollectionView(
        scrollDirection: .vertical,
        clipToBounds: false,
        showsHorizontalScrollIndicator: false,
        showsVerticalScrollIndicator: false)
   
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(contentView)
        contentView.addSubview(stackView)
        contentView.addSubview(collectionView)
        stackView.addArrangedSubview(iconeImageView)
        stackView.addArrangedSubview(nameLabel)
        
        contentView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        stackView.anchor(top: safeAreaLayoutGuide.topAnchor, left: contentView.leftAnchor, paddingTop: 15, paddingLeft: 15)
        collectionView.anchor(top: stackView.bottomAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 15)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
