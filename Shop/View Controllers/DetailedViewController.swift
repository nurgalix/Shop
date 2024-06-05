//
//  DetailedViewController.swift
//  Shop
//
//  Created by Nurgali on 05.06.2024.
//

import UIKit

final class DetailedViewController: UIViewController {
    
    internal var product: Product?
    private var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        
        guard let product = product else {
            imgView.image = UIImage(systemName: "basket")
            return
        }
        imgView.image = UIImage(named: product.image)
        detailLabel.text = product.description
        nameLabel.text = product.title
        buyNowButton.setTitle("Купить за \(product.cost) $", for: .normal)
        buyNowButton.layer.cornerRadius = 8
        buyNowButton.addTarget(self, action: #selector(buyNowButtonTapped), for: .touchUpInside)
        continueShopButton.setTitle("Положить в корзину", for: .normal)
        continueShopButton.layer.cornerRadius = 8
        continueShopButton.addTarget(self, action: #selector(continueShopButtonTapped), for: .touchUpInside)
        
        stackView = UIStackView(arrangedSubviews: [continueShopButton, buyNowButton])
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        addViews()
        
    }
    
    var imgView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let detailLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let buyNowButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.tintColor = .blue
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let continueShopButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.tintColor = .blue
        button.backgroundColor = .systemBlue    
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    func addViews() {
        view.addSubview(imgView)
        view.addSubview(nameLabel)
        view.addSubview(detailLabel)
        view.addSubview(stackView)
        
        
        let safeArea = view.safeAreaLayoutGuide
        
        
        imgView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 0).isActive = true
        imgView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: 16).isActive = true
        imgView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16).isActive = true
        imgView.widthAnchor.constraint(equalTo: safeArea.widthAnchor, constant: -16).isActive = true
        imgView.heightAnchor.constraint(equalTo: imgView.widthAnchor).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 10).isActive = true
        nameLabel.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 16
        ).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 8).isActive = true
        nameLabel.trailingAnchor.constraint(greaterThanOrEqualTo: safeArea.trailingAnchor, constant: 8).isActive = true
        
        detailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        detailLabel.widthAnchor.constraint(equalTo: safeArea.widthAnchor).isActive = true
        detailLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 8).isActive = true
        detailLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: 8).isActive = true
        
        
        stackView.topAnchor.constraint(greaterThanOrEqualTo: detailLabel.bottomAnchor, constant: 8).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        stackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -16).isActive = true
        
    }
    
    @objc func buyNowButtonTapped() {
        if let tabBarController = self.tabBarController {
            DataManager.shared.dataArray.append(product!)
            NotificationCenter.default.post(name: Notification.Name("RefreshTableView"), object: nil)
            tabBarController.selectedIndex = 1
        }
    }
    
    
    @objc func continueShopButtonTapped() {
        if let navigationController = self.navigationController {
            DataManager.shared.dataArray.append(product!)
            NotificationCenter.default.post(name: Notification.Name("RefreshTableView"), object: nil)
            navigationController.popToRootViewController(animated: true)
        }
    }
}



