//
//  TransitioningDelegate.swift
//  CustomUIViewControllerTransitions
//
//  Created by Lidiane Gomes Barbosa on 13/10/20.
//

import UIKit
extension FirstViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let firstViewController = presenting as? FirstViewController,
               let secondViewController = presented as? SecondViewController,
               let selectedCellImageViewSnapshot = selectedCellImageViewSnapshot
               else { return nil }

           animator = Animator(type: .present, firstViewController: firstViewController, secondViewController: secondViewController, selectedCellImageViewSnapshot: selectedCellImageViewSnapshot)
           return animator
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let secondViewController = dismissed as? SecondViewController,
               let selectedCellImageViewSnapshot = selectedCellImageViewSnapshot
               else { return nil }

           animator = Animator(type: .dismiss, firstViewController: self, secondViewController: secondViewController, selectedCellImageViewSnapshot: selectedCellImageViewSnapshot)
           return animator
    }
}
