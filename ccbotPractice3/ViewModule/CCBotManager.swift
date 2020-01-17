//
//  CCBotManager.swift
//  ccbotPractice3
//
//  Created by 羅翊修 on 2020/1/17.
//  Copyright © 2020 羅翊修. All rights reserved.
//

import UIKit

public class CCBotManager {
        
    var superViewController: UIViewController!
    var webURLString: String!
    
    var ccBotButton = CCBotButton()
    var ccBotViewController = CCBotViewController.shared
    lazy var coverView: UIView = UIView(frame: superViewController.view.frame)
    
    init(superViewController: UIViewController, webURLString: String) {
        
        print("CCBotManager init")
        self.superViewController = superViewController
        self.webURLString = webURLString
        
        superViewController.view.addSubview(coverView)
        ccBotViewController.url = webURLString
        ccBotViewController.dismissHandle = {
            self.coverView.alpha = 0
        }
        
        setCCBotButton()
    }
    
    func setCCBotButton() {
        
        let superView = superViewController.view!
        
        superView.addSubview(ccBotButton)
        
        ccBotButton.anchor(top: nil,
                           leading: nil,
                           bottom: superView.safeAreaLayoutGuide.bottomAnchor,
                           trailing: superView.trailingAnchor,
                           padding: UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0),
                           size: CGSize(width: 44, height: 44))
        
        ccBotButton.setImage(UIImage(named: "iconUdnMember"), for: .normal)
        ccBotButton.addTarget(self, action: #selector(presentCCBotVC), for: .touchUpInside)
    }
    
    @objc
    private func presentCCBotVC() {

        coverView.backgroundColor = .black
        coverView.alpha = 0.4
        ccBotViewController.modalPresentationStyle = .overCurrentContext
        superViewController.present(ccBotViewController, animated: true, completion: nil)
    }
}
