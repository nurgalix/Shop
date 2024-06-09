//
//  BasketViewController.swift
//  Shop
//
//  Created by Nurgali on 03.06.2024.
//

import UIKit

final class BasketViewController: UIViewController {
    
    private let dataManager = DataManager.shared
    private var tableView: UITableView!
    private var buyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        tableView = UITableView(frame: .zero, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NotificationCenter.default.addObserver(self, selector: #selector(refreshTableView), name: Notification.Name("RefreshTableView"), object: nil)
        
        
        buyButton = UIButton()
        buyButton.setTitle("Buy Now", for: .normal)
        buyButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        buyButton.backgroundColor = .systemBlue
        buyButton.setTitleColor(.white, for: .normal)
        buyButton.layer.cornerRadius = 8
        buyButton.translatesAutoresizingMaskIntoConstraints = false
        buyButton.addTarget(self, action: #selector(buyButtonPressed), for: .touchUpInside)
        view.addSubview(buyButton)
        
        
        
        NSLayoutConstraint.activate([
            // Constraints for UITableView
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: buyButton.topAnchor, constant: -10),
            
            // Constraints for UIButton
            buyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            buyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            buyButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            buyButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func buyButtonPressed() {
        
    }
    
    @objc func refreshTableView() {
        tableView.reloadData()
    }
}

extension BasketViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let product = dataManager.dataArray[indexPath.row]
        cell.textLabel?.text = product.title
        
        
        return cell
    }
}
