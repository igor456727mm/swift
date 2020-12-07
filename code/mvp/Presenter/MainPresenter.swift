//
//  MainPresenter.swift
//  pattern
//
//  Created by Igor Selivestrov on 23.06.2020.
//  Copyright © 2020 Igor Selivestrov. All rights reserved.
//

import Foundation

protocol MainViewProtocol : class {
    func succsess()
    func failure(error: Error)
}
protocol MainViewPresenterProtocol: class {
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol)
    func getPosts()
    var posts: [Post]? { get set }
    func tabOnThePost(post: Post?)
}

class MainPresenter: MainViewPresenterProtocol {
    var posts: [Post]?
    weak var view: MainViewProtocol?
    let networkService: NetworkServiceProtocol!
    var router : RouterProtocol?
    
    func getPosts() {
        networkService.getPost{ [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                    case .success(let posts): self.posts = posts
                    self.view?.succsess()
                case .failure( let error):
                    self.view?.failure(error: error)
                }
            }
            
            
        }
    }
    
   func tabOnThePost(post: Post?) {
       router?.showDetail(post: post)
   }
    
    
    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        getPosts()
        self.router = router
    }
    
    
    
    
}
