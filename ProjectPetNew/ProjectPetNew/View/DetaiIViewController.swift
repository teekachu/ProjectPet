//
//  DetaiIViewController.swift
//  ProjectPetNew
//
//  Created by Ting Becker on 3/8/21.
//

import UIKit
import WebKit

class DetaiIViewController: UIViewController {
    
    // MARK: - Properties
    var petname: String?
    let webview = WKWebView()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureWebview()
    }
    
    
    // MARK: - Privates
    private func configureUI() {
        self.view = webview
        title = petname?.capitalized
        
    }
    
    private func configureWebview(){
        let baseString = "https://en.wikipedia.org/wiki/"
        if let petname = petname{
            let urlString = "\(baseString)\(petname)"
            
            if let url = URL(string: urlString) {
                let request = URLRequest(url: url)
                webview.load(request)
            }
        }
        
    }
    
    
}

// MARK: - Extensions
