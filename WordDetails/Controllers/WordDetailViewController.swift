//
//  WordDetailViewController.swift
//  WordDetails
//
//  Created by Kateryna on 01/01/2025.
//

import UIKit

class WordDetailViewController: UIViewController {
    
    //MARK: - properties
    
    var word: Word?
    
    let definitionLabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.text = "There is no definition"
        return label
    }()
    
    //MARK: - View Controller Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        if let definition = word {
            definitionLabel.text = definition.definition
        }
        
        view.addSubview(definitionLabel)
        
        definitionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
             definitionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             definitionLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
             
             definitionLabel.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 20),
             definitionLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -20)
         ])
     }
}
