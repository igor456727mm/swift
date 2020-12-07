//
//  MainViewController.swift
//  pattern
//
//  Created by Igor Selivestrov on 23.06.2020.
//  Copyright © 2020 Igor Selivestrov. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: MainViewPresenterProtocol!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    @IBAction func didTabButtomAction(_ sender: UIButton) {
       
    }
}

extension MainViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return presenter.posts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let post = presenter.posts?[indexPath.row]
        cell.textLabel?.text = post?.body
        return cell
    }
    
    
}
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = presenter.posts?[indexPath.row]
       
        presenter.tabOnThePost(post: post)
    }
}
extension MainViewController: MainViewProtocol {
    func succsess() {
        tableView.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
}
