//
//  WebController.swift
//  ARecipe
//
//  Created by kingcos on 05/11/2017.
//  Copyright © 2017 kingcos. All rights reserved.
//

import UIKit
import WebKit

class WebController: UIViewController {

    var wkWebView: WKWebView!
    var urlString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        
        if let urlString = urlString,
            let url = URL(string: urlString) {
            wkWebView = WKWebView(frame: view.bounds)
            let request = URLRequest(url: url)
            wkWebView.load(request)
            view.addSubview(wkWebView)
            title = wkWebView.title
        }
    }
}
