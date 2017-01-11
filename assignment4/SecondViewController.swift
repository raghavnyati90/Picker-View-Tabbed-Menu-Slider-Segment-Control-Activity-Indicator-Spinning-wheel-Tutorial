//
//  SecondViewController.swift
//  assignment4
//
//  Created by Raghav Nyati on 10/20/16.
//  Copyright © 2016 Raghav Nyati. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textFieldView: UITextField!
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.isHidden = false
        textFieldView.delegate = self
        textFieldView.keyboardType = .asciiCapable
        textFieldView.returnKeyType = UIReturnKeyType.go
        loadWebView()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    func loadWebView(){
        let url = textFieldView.text
        let requestURL = NSURL(string:url!)
        let request = NSURLRequest(url: requestURL! as URL)
        webView.isUserInteractionEnabled = true
        webView.loadRequest(request as URLRequest)
        hideKeyboard()
    }
    
    @IBAction func doneEditing(_ sender: AnyObject) {
        hideKeyboard()
        loadWebView()
    }
    
    @IBAction func tapInBackground(_ sender: AnyObject) {
        hideKeyboard()
        loadWebView()
    }
    
    func hideKeyboard() {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        loadWebView()
        hideKeyboard()
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

