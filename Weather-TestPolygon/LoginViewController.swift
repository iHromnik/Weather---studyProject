//
//  ViewController.swift
//  Weather-TestPolygon
//
//  Created by iHRomnik on 04.12.2023.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
                   
    let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
    scrollView?.addGestureRecognizer(hideKeyboardGesture)
                  
               }
               
               
               @objc func keyboardWillShow(notification: Notification) {
                   guard let kbSize = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {return}
                   let insets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.size.height, right: 0.0)
                   scrollView.contentInset = insets
               }
               
               @objc func keyboardWillHide(notification: Notification) {
                   let insets = UIEdgeInsets.zero
                   scrollView.contentInset = insets
               }
               
               @objc func hideKeyboard() {
                   self.scrollView?.endEditing(true)
               }
        
    }


