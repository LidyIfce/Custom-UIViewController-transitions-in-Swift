//
//  SecondViewController.swift
//  CustomUIViewControllerTransitions
//
//  Created by Lidiane Gomes Barbosa on 08/10/20.
//

import UIKit

class SecondViewController: UIViewController {
    var data: CellData!
    lazy var closeButton: UIButton = {
        let button = UIButton()
        let cross = #imageLiteral(resourceName: "iconfinder_cross-24_103181").withRenderingMode(.alwaysTemplate)
        button.setImage(cross, for: .normal)
        button.addTarget(self, action: #selector(close), for: .touchUpInside)
        return button
    }()
    
    var locationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    var locationLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
        locationImageView.image = data.image
        locationLabel.text = data.title
        // Do any additional setup after loading the view.
    }
    
    func setup() {
        view.addSubview(locationImageView)
        locationImageView.translatesAutoresizingMaskIntoConstraints = false
        locationImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        locationImageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        locationImageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        locationImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        view.addSubview(locationLabel)
        locationLabel.textAlignment = .center
        locationLabel.numberOfLines = 0
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.centerYAnchor.constraint(equalTo: locationImageView.centerYAnchor).isActive = true
        locationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(closeButton)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.widthAnchor.constraint(equalToConstant: 44).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        closeButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        
    }
    
    @objc func close(_ sender: Any) {
        dismiss(animated: true)
    }
}
