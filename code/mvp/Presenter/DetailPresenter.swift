//
//  DetailPresenter.swift
//  pattern
//
//  Created by Igor Selivestrov on 23.06.2020.
//  Copyright © 2020 Igor Selivestrov. All rights reserved.
//

import Foundation

protocol DetailViewProtocol: class {
    func setPosts(post: Post?)
    
}

protocol DetailViewPresenterProtocol: class {
    init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, post: Post?, router: RouterProtocol )
    func setPost()
    func tab()
}

class DetailPresenter: DetailViewPresenterProtocol {
    func tab() {
        router?.popToRoot()
    }
    
    var post: Post?
    weak var view: DetailViewProtocol?
    let networkService: NetworkServiceProtocol!
    var router: RouterProtocol?
    required init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, post: Post?, router: RouterProtocol ) {
        self.view = view
        self.networkService = networkService
        self.post = post
        self.router = router
    }
    
    func setPost() {
        self.view?.setPosts(post: post)
    }
    
    
}
