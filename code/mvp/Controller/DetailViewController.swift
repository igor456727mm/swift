//
//  DetailViewController.swift
//  pattern
//
//  Created by Igor Selivestrov on 23.06.2020.
//  Copyright © 2020 Igor Selivestrov. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var postTitle: UILabel!
    var presenter: DetailViewPresenterProtocol!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setPost()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tabAction(_ sender: Any) {
        presenter.tab()
    }
    
    
}
extension DetailViewController: DetailViewProtocol {
    func setPosts(post: Post?) {
        self.postTitle.text = post?.body
    }
    
    
}

