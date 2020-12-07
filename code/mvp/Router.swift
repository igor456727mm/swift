//
//  Router.swift
//  pattern
//
//  Created by Igor Selivestrov on 23.06.2020.
//  Copyright © 2020 Igor Selivestrov. All rights reserved.
//

import Foundation
import UIKit

protocol RouterMain {
    
    var navigationController: UINavigationController? { get set }
    var assemblyBuilder: AsselderBuilderProtocol? { get set }
    
}

protocol RouterProtocol: RouterMain{
    func initialViewController()
    func showDetail(post: Post?)
    func popToRoot()
    
}
class Router: RouterProtocol {
    
    var navigationController: UINavigationController?
    
    var assemblyBuilder: AsselderBuilderProtocol?
    init(navigationController: UINavigationController, assemblyBuilder: AsselderBuilderProtocol) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
    func initialViewController() {
        if let navigationController = navigationController {
           
            guard  let mainViewController = assemblyBuilder?.createMainModule( router: self) else {
                return
            }
            navigationController.viewControllers = [mainViewController]
            
        }
        
    }
    
    func showDetail(post: Post?) {
        if let navigationController = navigationController {
            guard  let detailViewController = assemblyBuilder?.createDetailModule(post: post, router: self) else {
                return
            }
            navigationController.pushViewController(detailViewController, animated: true)
            
        }
    }
    
    func popToRoot() {
        if let navigationController = navigationController {
            
            navigationController.popViewController(animated: true)
            
        }
    }
    
    
}
