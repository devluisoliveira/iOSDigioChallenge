//
//  DetailsViewController.swift
//  DigioChallenge
//
//  Created by Luis Eduardo Silva Oliveira on 23/02/22.
//

import Foundation
import UIKit
import Kingfisher

final class DetailsViewController: UIViewController {
    
    // MARK: - Properties
    
    private var detailsView: DetailsView { return view as! DetailsView }
    var name: String = ""
    var imagem: String = ""
    var productDescription: String = ""
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.isHidden = false
    }
    
    // MARK: - View Lifecycle
    
    override func loadView() {
        view = DetailsView(frame: UIScreen.main.bounds)
    }
    
    // MARK: - Helpers
    
    private func configureUI() {
        let url = String(imagem)
        if let urlPoster = URL(string: "\(url)") {
            detailsView.iconeImageView.kf.setImage(with: urlPoster)
        } else {
            detailsView.iconeImageView.image = UIImage(named: "notimage")
        }
        detailsView.nameLabel.text = name
        detailsView.descriptionLabel.text = productDescription
    }
}
