//
//  ProductsCollectionCell.swift
//  DigioChallenge
//
//  Created by Luis Eduardo Silva Oliveira on 23/02/22.
//

import Foundation
import UIKit
import Kingfisher

private var productsIdentifier = "ProductsCell"

protocol ProductDelegate: AnyObject {
    func hundlerSelect(_ cell: ProductsCollectionCell, _ name: String, _ image: String, _ productDescription: String)
}

final class ProductsCollectionCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var productsArray: [Product] = []
    
    //MARK: - Constraints Cell
    let cellWidth = (3 / 4) * UIScreen.main.bounds.width * 0.5
    let sectionSpacing = (1 / 8) * UIScreen.main.bounds.width * 0.4
    let cellSpacing = 20.0
    
    weak var delegate: ProductDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let appsCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.isScrollEnabled = true
        collectionView.backgroundColor = UIColor.clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    func setupViews() {
        backgroundColor = UIColor.clear
        addSubview(appsCollectionView)
        appsCollectionView.anchor(
            top: topAnchor,
            left: leftAnchor,
            right: rightAnchor,
            paddingTop: 0,
            paddingLeft: 0,
            paddingRight: 0,
            height: 150)
        
        appsCollectionView.dataSource = self
        appsCollectionView.delegate = self

        appsCollectionView.register(ProductsCell.self, forCellWithReuseIdentifier: productsIdentifier)
        appsCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: productsIdentifier, for: indexPath) as! ProductsCell
        let url = String(productsArray[indexPath.row].imageURL)
        if let urlPoster = URL(string: "\(url)") {
            cell.productsImageView.kf.setImage(with: urlPoster)
        } else {
            cell.productsImageView.image = UIImage(named: "notimage")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 140)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: sectionSpacing, bottom: 0, right: sectionSpacing)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let name = String(self.productsArray[indexPath.row].name)
        let image = String(self.productsArray[indexPath.row].imageURL)
        let productDescription = String(self.productsArray[indexPath.row].productDescription)
        delegate?.hundlerSelect(self, name, image, productDescription)
    }
}
