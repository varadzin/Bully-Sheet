//
//  WebView.swift
//  Bully Sheet
//
//  Created by Frantisek Varadzin on 28/12/2020.
//  First Chapter of Book  - End of procrastination

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
        navigationController?.navigationBar.isHidden = false
        loadWebView()
        setupUI()
        backBarButton()
    }
        
    func loadWebView() {
        let myUrl = URL(string: "https://procrastination.com/assets/frontend/img/The%20End%20of%20Procrastination%20-%20free%20chapter.pdf")
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
    
    func backBarButton() {
        let backButton = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(goBack))
        self.navigationItem.leftBarButtonItem = backButton
        backButton.tintColor = .systemRed
    }
    
    @objc func goBack() {
        self.navigationController?.popViewController(animated: true)
        
    }
}
