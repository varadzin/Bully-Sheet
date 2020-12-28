//
//  WebView.swift
//  Bully Sheet
//
//  Created by Frantisek Varadzin on 28/12/2020.
//

import WebKit
import UIKit

class WebView: UIViewController, WKUIDelegate {
    
    lazy var webView: WKWebView = {
        let webConfiguration = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero,configuration: webConfiguration)
        webView.uiDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
     return webView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        let myUrl = URL(string: "https://www.konec-prokrastinace.cz/homepage/")
        let myRequest = URLRequest(url: myUrl!)
        webView.load(myRequest)
            
        
    }
    
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(webView)
        
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            webView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            webView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
    }
    
    
    
}
