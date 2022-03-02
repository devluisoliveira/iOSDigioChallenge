//
//  CashHeaderCell.swift
//  DigioChallenge
//
//  Created by Luis Eduardo Silva Oliveira on 23/02/22.
//

import Foundation
import UIKit

final class CashHeaderCell: UICollectionReusableView {
    
    // MARK: - Properties
    
    lazy var digioView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.setDimension(widht: 110, height: 40)
        return view
    }()
    
    lazy var digioHeaderLabel: UILabel =  {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .systemBlue
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "digio"
        return label
    }()
    
    lazy var cashHeaderLabel: UILabel =  {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .systemGray
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Cash"
        return label
    }()
    
    lazy var stackView = makeStackView(
        axis: .horizontal,
        distribution: .fill,
        spacing: 5,
        alignment: .center)
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(digioView)
        digioView.addSubview(stackView)
        stackView.addArrangedSubview(digioHeaderLabel)
        stackView.addArrangedSubview(cashHeaderLabel)
        digioView.anchor(top: topAnchor, left: leftAnchor,
                         bottom: bottomAnchor,
                         paddingTop: 0, paddingLeft: 20,
                         paddingBottom: 0, paddingRight: 0)
        stackView.anchor(top: digioView.topAnchor, left: digioView.leftAnchor,
                         bottom: digioView.bottomAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
