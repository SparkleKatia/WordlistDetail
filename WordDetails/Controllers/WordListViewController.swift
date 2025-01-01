//
//  ViewController.swift
//  WordDetails
//
//  Created by Kateryna on 01/01/2025.
//

import UIKit

class WordListViewController: UIViewController {
    
    //MARK: - properties
    
    var tableView: UITableView?
    
    let words = [
        Word(word: "An apple", definition: "a fruit that grows on trees"),
        Word(word: "A banana", definition: "a fruit that is yellow"),
        Word(word: "An melon", definition: "a fruit that grows on the ground")
    ]
    
    //MARK: - View Controller Lifecycle Methods

    override func loadView() {
        let mainView = UIView()
        let table = UITableView()
        
        mainView.addSubview(table)
        self.view = mainView
        
        self.tableView = table
        
        table.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.topAnchor),
            table.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            table.bottomAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        tableView?.dataSource = self
        tableView?.delegate = self
        
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
}

//MARK: - Data Source and Delegate Methods

extension WordListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        words.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = words[indexPath.row].word
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let wordDetailVC = WordDetailViewController()
        let selectedWord = words[indexPath.row]
        wordDetailVC.word = selectedWord
        navigationController?.pushViewController(wordDetailVC, animated: true)
    }
}

