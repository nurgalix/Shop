//
//  CollectionViewCell.swift
//  Shop
//
//  Created by Nurgali on 04.06.2024.
//

import UIKit

final class CollectionViewCell: UICollectionViewCell {
    
    let imgView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.white
        imageView.image = UIImage(systemName: "basket")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "424 likes"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let costButton: UIButton = {
        let button = UIButton()
        button.setTitle("like", for: .normal)
        
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(UIColor.black, for: .normal)
        button.tintColor = .blue
        button.backgroundColor = .brown
        button.contentMode = .scaleToFill
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addViews()
    }
    
    func addViews(){
        
        addSubview(imgView)
        addSubview(titleLabel)
        addSubview(costButton)
        
        imgView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        imgView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 8).isActive = true
        imgView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        imgView.widthAnchor.constraint(equalTo: widthAnchor, constant: -16).isActive = true
        imgView.heightAnchor.constraint(equalTo: imgView.widthAnchor).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 10).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        
        costButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        costButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        costButton.leftAnchor.constraint(greaterThanOrEqualTo: leftAnchor, constant: 8).isActive = true
        costButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
