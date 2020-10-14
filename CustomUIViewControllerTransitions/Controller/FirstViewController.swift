//
//  FirstViewController.swift
//  CustomUIViewControllerTransitions
//
//  Created by Lidiane Gomes Barbosa on 08/10/20.
//

import UIKit

class FirstViewController: UIViewController {
    
    var selectedCell: CollectionViewCell?
    var selectedCellImageViewSnapshot: UIView?
    var animator: Animator?

    lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
      
        let collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollection()
        
    }
    
    func setupCollection() {
        collectionView.backgroundColor = .white
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    
    func presentSecondViewController(with data: CellData) {
        let secondViewController = SecondViewController()

        secondViewController.modalPresentationStyle = .fullScreen
        secondViewController.data = data
        secondViewController.transitioningDelegate = self
        self.present(secondViewController, animated: true)
    }

}
