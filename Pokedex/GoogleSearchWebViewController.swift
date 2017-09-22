//
//  GoogleSearchWebView.swift
//  Pokedex
//
//  Created by Annie Tang on 9/20/17.
//  Copyright © 2017 trainingprogram. All rights reserved.
//

import UIKit

class GoogleSearchWebViewController: UIViewController, UIWebViewDelegate {
    
    /* credit to stack overflow, question 39682344 */
    
    var webView: UIWebView!
    var pokeName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView = UIWebView(frame: UIScreen.main.bounds)
        webView.delegate = self
        view.addSubview(webView)
        if let url = URL(string: "https://google.com/search?q=" + pokeName) {
            print(url)
            let request = URLRequest(url: url)
            webView.loadRequest(request)
        }
    }
}
