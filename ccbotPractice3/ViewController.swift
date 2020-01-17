//
//  ViewController.swift
//  ccbotPractice3
//
//  Created by 羅翊修 on 2020/1/17.
//  Copyright © 2020 羅翊修. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var ccBotManager: CCBotManager!
    let urlString = "https://ccbot-testfront.udn-device-dept.net/#/utravel?conversation_id=5e1eead0bdf13&app=true"
    var urlComponet = URLComponents()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
        setURLComponet()
        ccBotManager = CCBotManager(superViewController: self, webURLString: "https:ccbot-testfront.udn-device-dept.net/#/utravel?conversation_id=5e1eead0bdf13&app=true")
    }

    func setup() {
        
        self.view.backgroundColor = .white
    }
    
    func setURLComponet() {
        
        urlComponet.scheme = "https"
        urlComponet.path = "ccbot-testfront.udn-device-dept.net/#/utravel"
        urlComponet.queryItems = [URLQueryItem(name: "conversation_id", value: "5e1eead0bdf13"),
                                  URLQueryItem(name: "app", value: "true")
        ]
        print(urlString)
        print(urlComponet.url)
    }
}

