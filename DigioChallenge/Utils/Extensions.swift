//
//  Extensions.swift
//  KabumChallenge
//
//  Created by Luis Eduardo Silva Oliveira on 15/10/21.
//

import UIKit

extension UIView {
    
    /// Add Shadow
    func addShadow() {
        self.layer.shadowColor = UIColor.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.4).cgColor
        self.layer.shadowOpacity = 1.0
        self.layer.shadowOffset = CGSize.init(width: 0.0, height: 0.0)
        self.layer.shadowRadius = 4.0
    }
    
    /// Add Shadow Border and Corner
    func addShadowAndBorderAndCorner() {
        self.addShadow()
        self.layer.cornerRadius = 12.0
    }
    
    /// Collection View
    func makeCollectionView(
        scrollDirection: UICollectionView.ScrollDirection,
        clipToBounds: Bool = true,
        showsHorizontalScrollIndicator: Bool = true,
        showsVerticalScrollIndicator: Bool = true
    ) -> UICollectionView {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = scrollDirection
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .clear
        collectionView.clipsToBounds = clipToBounds
        collectionView.showsHorizontalScrollIndicator = showsHorizontalScrollIndicator
        collectionView.showsVerticalScrollIndicator = showsVerticalScrollIndicator
        
        return collectionView
    }
    
    /// StackView
    func makeStackView(
        axis: NSLayoutConstraint.Axis,
        distribution: UIStackView.Distribution,
        spacing: CGFloat,
        alignment: UIStackView.Alignment? = nil
    ) -> UIStackView {
        let stack = UIStackView()
        stack.distribution = distribution
        stack.spacing = spacing
        stack.axis = axis
        if let align = alignment {
            stack.alignment = align
        }
        return stack
    }
}

// MARK: - UICollectionView

extension UICollectionView {
   
    /// Register a given CollectionViewCell type
    func registerCell<T:UICollectionViewCell>(from type:T.Type){
        let name = String(describing: T.self)
        register(T.self, forCellWithReuseIdentifier: name)
    }
}
