//
//  CashCollectionCell.swift
//  DigioChallenge
//
//  Created by Luis Eduardo Silva Oliveira on 23/02/22.
//

import Foundation
import UIKit
import Kingfisher

private var cashIdentifier = "CashCell"

protocol CashDelegate: AnyObject {
    func hundlerSelect(_ cell: CashCollectionCell, _ name: String, _ image: String, _ productDescription: String)
}

final class CashCollectionCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var cash: Cash?
    
    //MARK: - Constraints Cell
    let cellWidth = (3 / 4) * UIScreen.main.bounds.width * 1.2
    let sectionSpacing = (1 / 8) * UIScreen.main.bounds.width * 0.4
    let cellSpacing = 20.0
    
    weak var delegate: CashDelegate?
    
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
            height: 100)
        
        appsCollectionView.dataSource = self
        appsCollectionView.delegate = self
        appsCollectionView.register(CashCell.self, forCellWithReuseIdentifier: cashIdentifier)
        appsCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cashIdentifier, for: indexPath) as! CashCell
        let url = String(cash?.bannerURL ?? "")
        if let urlPoster = URL(string: "\(url)") {
            cell.cashImageView.kf.setImage(with: urlPoster)
        } else {
            cell.cashImageView.image = UIImage(named: "notimage")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellWidth, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: sectionSpacing, bottom: 0, right: sectionSpacing)
    }
}
