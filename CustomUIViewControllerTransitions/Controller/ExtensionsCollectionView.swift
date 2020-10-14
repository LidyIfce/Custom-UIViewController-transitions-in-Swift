//
//  ExtensionsCollectionView.swift
//  CustomUIViewControllerTransitions
//
//  Created by Lidiane Gomes Barbosa on 13/10/20.
//

import UIKit

extension FirstViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        DataManager.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell else {return UICollectionViewCell() }
        cell.configure(with: DataManager.data[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 30) / 2
        return .init(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedCell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell
        selectedCellImageViewSnapshot = selectedCell?.locationImageView.snapshotView(afterScreenUpdates: false)
        presentSecondViewController(with: DataManager.data[indexPath.row])
    }
    
}
