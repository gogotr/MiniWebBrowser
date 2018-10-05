//
//  ViewController.swift
//  MiniWebBrowser
//
//  Created by 이상묵 on 2018. 8. 6..
//  Copyright © 2018년 이상묵. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, UITextFieldDelegate, WKNavigationDelegate{

    @IBOutlet weak var bookmarkSegment: UISegmentedControl!
    @IBOutlet weak var txtURL: UITextField!
    @IBOutlet weak var loadingCircle: UIActivityIndicatorView!
    @IBOutlet weak var mainWebView: WKWebView!
    @IBAction func bookmarkAction(_ sender: Any) {
        var myURL = ""
        
        switch bookmarkSegment.titleForSegment(at: bookmarkSegment.selectedSegmentIndex) {
        case "facebook":
            myURL = "https://www.facebook.com"
        case "twitter":
            myURL = "https://twitter.com"
        case "instagram":
            myURL = "https://www.instagram.com"
        case "apple":
            myURL = "https://www.apple.com"
        default:
            myURL = "https://www.naver.com"
        }
        
        mainWebView.load(URLRequest(url: URL(string: myURL)!))
        txtURL.text = myURL
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        var myURL = "\(txtURL.text!)"
        if !myURL.hasPrefix("https://")
        {
            myURL = "https://\(txtURL.text!)"
        }
        
        mainWebView.load(URLRequest(url: URL(string: myURL)!))
        print(txtURL.text!)
        txtURL.resignFirstResponder()
        return true
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        loadingCircle.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loadingCircle.stopAnimating()
    }
    
    @IBAction func goBack(_ sender: Any) {
        mainWebView.goBack()
    }
    
    @IBAction func goFoward(_ sender: Any) {
        mainWebView.goForward()
    }
    
    @IBAction func stopPage(_ sender: Any) {
        mainWebView.stopLoading()
    }
    
    @IBAction func refreshPage(_ sender: Any) {
        mainWebView.reload()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainWebView.navigationDelegate = self
        let myWebSiteUrl = "https://gogotr.github.io"
        let myURL = URL(string: myWebSiteUrl)
        let myRequest = URLRequest (url: myURL!)
        mainWebView.load(myRequest)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

