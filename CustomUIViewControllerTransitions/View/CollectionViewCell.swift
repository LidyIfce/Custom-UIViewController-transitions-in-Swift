//
//  CollectionViewCell.swift
//  CustomUIViewControllerTransitions
//
//  Created by Lidiane Gomes Barbosa on 08/10/20.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    static let identifier = "CollectionViewCellIdentifier"
    var locationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    var locationLabel = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layer.cornerRadius = 12.0
        contentView.layer.masksToBounds = true

        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1.0)
        layer.shadowRadius = 1.0
        layer.shadowOpacity = 0.2
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
    }
    
    func configure(with cellData: CellData) {
        locationImageView.image = cellData.image
        locationLabel.text = cellData.title
        setup()
    }
    
    func setup(){
        contentView.addSubview(locationImageView)
        locationImageView.translatesAutoresizingMaskIntoConstraints = false
        locationImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        locationImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        locationImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        locationImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        contentView.addSubview(locationLabel)
        locationLabel.textAlignment = .center
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        locationLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    }
}
