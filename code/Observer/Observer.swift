//
//  Observer.swift
//  code
//
//  Created by Igor Selivestrov on 06.12.2020.
//  Copyright © 2020 Igor Selivestrov. All rights reserved.
//

import Foundation
import UIKit

protocol Observer: class  {
    func update(subject: NotificationCenters)
}
class NotificationCenters {
    var state: Int = {
        return Int(arc4random_uniform(10))
    }()
    
    private lazy var observers = [Observer]()
    
    func subscribe(_ observer : Observer)  {
        print(#function)
        observers.append(observer)
    }
    func unsubscribe( observer : Observer?)  {
        if let index = observers.firstIndex(where: {$0 === observer} )
        {
            observers.remove(at: index)
        }
        
    }
    func notify()
    {
        print(#function)
        observers.forEach({ $0.update(subject: self)})
    }
    func someBusiness()
    {
        print(#function)
        state = Int(arc4random_uniform(10))
        notify()
    }
}
class ConreteObserverA: Observer {
    func update(subject: NotificationCenters) {
        print("update \(subject.state)")
    }
    
    
}


class ViewControllerObserver: UIViewController, Observer {
    
    let NotificationCenter = NotificationCenters()
    let observer1 = ConreteObserverA()
    
    func update(subject: NotificationCenters) {
        print("update ")
    }
    
    
    @IBAction func update(_ sender: Any) {
        NotificationCenter.someBusiness()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }


}

