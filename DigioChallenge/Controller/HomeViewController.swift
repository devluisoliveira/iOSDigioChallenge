//
//  HomeCollectionViewController.swift
//  DigioChallenge
//
//  Created by Luis Eduardo Silva Oliveira on 16/02/22.
//

import Foundation
import UIKit
import Kingfisher

private var spotlightIdentifier = "SpotlightCollectionCell"
private var productsIdentifier = "ProductsCollectionCell"
private var cashIdentifier = "CashCollectionCell"
private var cashHeaderIdentifier = "CashHeaderCell"

final class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    private var listProducts: ProductResponse?
    private var spotlightArray: [Spotlight] = []
    private var productsArray: [Product] = []
    private var cash: Cash?
    private var loadingProdutos = false
    private var homeView: HomeView { return view as! HomeView }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        fetchSpotlight()
    }
    
    //MARK: - View Lifecycle
    
    override func loadView() {
        view = HomeView(frame: UIScreen.main.bounds)
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .white
        homeView.collectionView.registerCell(from: SpotlightCollectionCell.self)
        homeView.collectionView.registerCell(from: CashCollectionCell.self)
        homeView.collectionView.registerCell(from: ProductsCollectionCell.self)
        homeView.collectionView.contentInsetAdjustmentBehavior = .never
        homeView.collectionView.register(CashHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: cashHeaderIdentifier)
        homeView.collectionView.isScrollEnabled = false
        homeView.collectionView.delegate = self
        homeView.collectionView.dataSource = self
        homeView.collectionView.backgroundColor = .white
        reloadCollection()
        homeView.collectionView.reloadData()
    }
    
    func reloadCollection() {
        sectionsCollections = []
        rowsCollection = []
        
        sectionsCollections.append(RowCollection("", "", .firstSection))
        sectionsCollections.append(RowCollection("", "digio Cash", .secondSection))
        sectionsCollections.append(RowCollection("", "Produtos", .thirtSections))

        rowsCollection.append([RowCollection(spotlightIdentifier, "", .firstSection)])
        rowsCollection.append([RowCollection(cashIdentifier, "", .secondSection)])
        rowsCollection.append([RowCollection(productsIdentifier, "", .thirtSections)])
    }
    
    // MARK: - API
    
    private func fetchSpotlight() {
        Service.shared.listProducts { products, err in
            if let err = err {
                print(err)
                return
            }
            if let products = products {
                DispatchQueue.main.async {
                    self.spotlightArray.removeAll()
                    self.productsArray.removeAll()
                    self.listProducts = products
                    self.spotlightArray.append(contentsOf: products.spotlight ?? [])
                    self.productsArray.append(contentsOf: products.products ?? [])
                    self.cash = self.listProducts?.cash
                    self.loadingProdutos = false
                    self.homeView.collectionView.reloadData()
                }
            }
        }
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionsCollections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rowsCollection[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        var return_header: UICollectionReusableView!
       
        switch rowsCollection[indexPath.section][indexPath.row].action {
        case .firstSection:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: cashHeaderIdentifier, for: indexPath) as! CashHeaderCell
            header.cashHeaderLabel.text = ""
            header.digioHeaderLabel.text = ""
            return_header = header
        case .secondSection:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: cashHeaderIdentifier, for: indexPath) as! CashHeaderCell
            header.cashHeaderLabel.text = "Cash"
            header.digioHeaderLabel.text = "digio"
            return_header = header
        case .thirtSections:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: cashHeaderIdentifier, for: indexPath) as! CashHeaderCell
            header.cashHeaderLabel.text = ""
            header.digioHeaderLabel.text = "Produtos"
            return_header = header
        default:
            break
        }
        return return_header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
       
        var height: CGFloat = 0.0
        
        switch sectionsCollections[section].action {
        case .firstSection:
            height = 0.0
        case .secondSection, .thirtSections:
            height = 40
        default:
            break
        }
        return CGSize(width: view.frame.width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var returnCell: UICollectionViewCell!
        
        switch rowsCollection[indexPath.section][indexPath.row].action {
        case .firstSection:
             let cell = collectionView.dequeueReusableCell(withReuseIdentifier: spotlightIdentifier, for: indexPath) as! SpotlightCollectionCell
            cell.delegate = self
            cell.spotlightArray = self.spotlightArray
            cell.appsCollectionView.reloadData()
            returnCell = cell
        case .secondSection:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cashIdentifier, for: indexPath) as! CashCollectionCell
            cell.delegate = self
            cell.cash = self.cash
            cell.appsCollectionView.reloadData()
           returnCell = cell
        case .thirtSections:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: productsIdentifier, for: indexPath) as! ProductsCollectionCell
            cell.delegate = self
            cell.productsArray = self.productsArray
            cell.appsCollectionView.reloadData()
           returnCell = cell
        default:
            break
        }
        return returnCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Utilities().sectionInsets.left
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var returnCell = CGSize(width: collectionView.frame.width, height: 210)
        
        switch rowsCollection[indexPath.section][indexPath.row].action {
        case .firstSection:
            returnCell = CGSize(width: collectionView.frame.width, height: 230)
        case .secondSection:
           returnCell = CGSize(width: collectionView.frame.width, height: 140)
        case .thirtSections:
           returnCell = CGSize(width: collectionView.frame.width, height: 180)
        default:
            break
        }
        return returnCell
    }
}

// MARK: - SpotlightDelegate

extension HomeViewController: SpotlightDelegate {
    
    func hundlerSelect(_ cell: SpotlightCollectionCell, _ name: String, _ image: String, _ productDescription: String) {
        let controller = DetailsViewController()
        controller.name = name
        controller.imagem = image
        controller.productDescription = productDescription
        navigationController?.pushViewController(controller, animated: true)
    }
}

// MARK: - CashDelegate

extension HomeViewController: CashDelegate {
    func hundlerSelect(_ cell: CashCollectionCell, _ name: String, _ image: String, _ productDescription: String) {
        let controller = DetailsViewController()
        controller.name = name
        controller.imagem = image
        controller.productDescription = productDescription
        navigationController?.pushViewController(controller, animated: true)
    }
}

// MARK: - CashDelegate

extension HomeViewController: ProductDelegate {
    func hundlerSelect(_ cell: ProductsCollectionCell, _ name: String, _ image: String, _ productDescription: String) {
        let controller = DetailsViewController()
        controller.name = name
        controller.imagem = image
        controller.productDescription = productDescription
        navigationController?.pushViewController(controller, animated: true)
    }
}
