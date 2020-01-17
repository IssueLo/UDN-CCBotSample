//
//  CCBotViewController.swift
//  ccbotPractice3
//
//  Created by 羅翊修 on 2020/1/17.
//  Copyright © 2020 羅翊修. All rights reserved.
//

import UIKit
import WebKit

public class CCBotViewController: UIViewController {
    
    public static let shared = CCBotViewController()
    
    private var webView: WKWebView!
    private let webViewConfig = WKWebViewConfiguration()
    public var url: String = ""
    var dismissHandle: (() -> ())?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .clear
        setConfig()
        setWebView(urlString: url)
    }
    
    private func setConfig() {
        
        webViewConfig.userContentController = WKUserContentController()
        webViewConfig.userContentController.add(self, name: "botclosed")
    }
    
    private func setWebView(urlString: String) {
        
        webView = WKWebView(frame: .zero, configuration: webViewConfig)
//        webView.navigationDelegate = self
        webView.addCornerRadius(corners: [.layerMaxXMinYCorner, .layerMinXMinYCorner], radius: 8)

        view.addSubview(webView)

        let layoutGuide = view.safeAreaLayoutGuide
        webView.anchor(top: view.topAnchor,
                       leading: layoutGuide.leadingAnchor,
                       bottom: view.bottomAnchor,
                       trailing: layoutGuide.trailingAnchor,
                       padding: UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0))

        if let url = URL(string: url) {
            webView.load(URLRequest(url: url))
        }
    }
}

extension CCBotViewController: WKScriptMessageHandler {
    
    public func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        
        print(message.body)
 
        dismissHandle?()
        self.dismiss(animated: true, completion: nil)
    }
}
