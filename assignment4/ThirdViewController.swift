//
//  ThirdViewController.swift
//  assignment4
//
//  Created by Raghav Nyati on 10/20/16.
//  Copyright © 2016 Raghav Nyati. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UITextViewDelegate {
    @IBOutlet weak var switchState: UISwitch!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var buttonView: UIButton!
    @IBOutlet weak var segmentView: UISegmentedControl!
    
    @IBAction func buttonClicked(_ sender: AnyObject) {
        let alert = UIAlertController(title: "Alert", message: "Do you like iPhone?", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
    }
    
    @IBAction func switchStateChanged(_ sender: AnyObject) {
        if(switchState.isOn){
            activityIndicatorView.startAnimating()
        }
        else{
            activityIndicatorView.stopAnimating()
        }
    }
    
    @IBAction func segmentStateChanged(_ sender: AnyObject) {
        hideKeyboard()
        switch segmentView.selectedSegmentIndex{
        case 0:
            switchState.isHidden = false
            activityIndicatorView.isHidden = false
            textView.isHidden = true
            buttonView.isHidden = true
        case 1:
            switchState.isHidden = true
            activityIndicatorView.isHidden = true
            buttonView.isHidden = true
            textView.isHidden = false
        case 2:
            switchState.isHidden = true
            activityIndicatorView.isHidden = true
            textView.isHidden = true
            buttonView.isHidden = false
        default:
            break;
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
        textView.keyboardType = .asciiCapable
        textView.returnKeyType = UIReturnKeyType.done
        switchState.isOn = false
        activityIndicatorView.stopAnimating()
        segmentView.selectedSegmentIndex = 0
        textView.isHidden = true
        buttonView.isHidden = true
    }
    
    func hideKeyboard() {
        view.endEditing(true)
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n")
        {
            view.endEditing(false)
            return false
        }
        else
        {
            return true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
