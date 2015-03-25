//
//  CreateViewController.swift
//  MiniMeet
//
//  Created by Michelle Venetucci Harvey on 3/14/15.
//  Copyright (c) 2015 hi_hu. All rights reserved.
//

import UIKit
import Foundation

class CreateViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextView!
    
    var borderColor = UIColor(red: 222/255, green: 222/255, blue: 222/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Create Event"
        
        scrollView.contentSize = contentView.frame.size


        
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func cancelDidPress(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    // Calculate hex values for color: 
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    
//    func textFieldShouldReturn(textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return true
//    }
//    
//    func keyboardWillShow(notification: NSNotification!) {
//        var userInfo = notification.userInfo!
//        
//        
//        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
//        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
//        var animationDuration = durationValue.doubleValue
//        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
//        var animationCurve = curveValue.integerValue
//        
//        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(UInt(animationCurve << 16)), animations: {
//            
//
//            }, completion: nil)
//        
//
//    }
//    
//    func keyboardWillHide(notification: NSNotification!) {
//        var userInfo = notification.userInfo!
//        
//        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
//        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
//        var animationDuration = durationValue.doubleValue
//        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
//        var animationCurve = curveValue.integerValue
//    }
    


    
    @IBAction func addImageDidPress(sender: AnyObject) {
    
        performSegueWithIdentifier("addImageSegue", sender: self)
        
    }
    
    
    
    @IBAction func tapGesture(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}

