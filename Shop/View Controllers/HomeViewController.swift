//
//  HomeViewController.swift
//  Shop
//
//  Created by Nurgali on 03.06.2024.
//

import UIKit

final class HomeViewController: UIViewController {

    private let tableView = UITableView()
    private let images = ["image1", "image2"]
    private let products: [Product] = [
        Product(image: "image1", title: "Курсы английского языка", description: "Наши курсы английского языка разработаны для людей любого уровня подготовки – от начинающих до продвинутых. Мы предлагаем разнообразные программы обучения, которые помогут вам развить все необходимые навыки для свободного владения английским языком.", cost: 15.7),
        Product(image: "image2", title: "Футболка", description: "Наша классическая футболка Unisex – идеальный выбор для тех, кто ценит стиль и комфорт. Изготовленная из высококачественного хлопка, эта футболка станет незаменимой вещью в вашем гардеробе.", cost: 10.2)]
    private let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.largeContentTitle = "Shop"

        setupCollectionView()

        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .vertical
        }
    }

    private func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell {
            cell.imgView.image = UIImage(named: products[indexPath.row].image)
            cell.titleLabel.text = products[indexPath.row].title
            cell.imgView.layer.cornerRadius = 15
            cell.imgView.layer.masksToBounds = true
            cell.backgroundColor = .gray
            cell.costButton.setTitle(" \(products[indexPath.row].cost) $", for: .normal)
            cell.costButton.backgroundColor = .white
            cell.costButton.layer.cornerRadius = 5
            return cell
        } else {
            print("Error: Unable to dequeue a CollectionViewCell")
            return UICollectionViewCell()
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width - 32) / 2, height: (collectionView.frame.height - 60) / 3)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = DetailedViewController()
        detailVC.product = products[indexPath.row]
        detailVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

class DataManager {
    static let shared = DataManager()
    var dataArray: [Product] = []

    private init() {}
}
