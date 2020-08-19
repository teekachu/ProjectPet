//
//  DetailViewController.swift
//  projectPet
//
//  Created by Ting Becker on 8/18/20.
//  Copyright © 2020 TeeksCode. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController, WKNavigationDelegate {
    
    var webview: WKWebView!
    var urlToLoad: String? = ""
    
    override func loadView() {
        webview = WKWebView()
        view = webview
        webview.navigationDelegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let selectedURL = urlToLoad{
            let url = URL(string: selectedURL)!
            webview.load(URLRequest(url: url))
        } else {
            fatalError("Something went wrong, check URL")
        }
        
 
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
