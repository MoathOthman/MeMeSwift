//
//  MeMeEditorViewController.swift
//  MeMe
//
//  Created by Moath_Othman on 4/11/15.
//  Copyright (c) 2015 Moba. All rights reserved.
//

import UIKit
import Foundation
class MeMeEditorViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var containerToTopConstraint: NSLayoutConstraint!

    @IBOutlet weak var containerToBottomConstraint: NSLayoutConstraint!

    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var upperTextField: UITextField!
    @IBOutlet weak var bottomtextField: UITextField!
    @IBOutlet weak var memeContainerView: UIView!
    @IBOutlet weak var bottomToolBar: UIToolbar!
    @IBOutlet weak var upperNavBar: UINavigationBar!


    @IBAction func dismissViewController(sender: UIBarButtonItem) {
        self.dismissViewController(sender)
    }
    @IBAction func shareImage(sender: UIBarButtonItem) {

    }
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        cameraButton.enabled = UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        // Subscribe to keyboard notifications to allow the view to raise when necessary
        self.subscribeToKeyboardNotifications()
    }


    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.unsubscribeFromKeyboardNotifications()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //MARK: - Image Picking Action Methods
    @IBAction func pickAnImageFromAlbum (sender: AnyObject) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary

        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    @IBAction func pickAnImageFromCamera (sender: AnyObject) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.Camera

        self.presentViewController(imagePicker, animated: true, completion: nil)
    }

    //MARK: - ImagePickerDelegate Methods
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.image = image
            self.dismissViewControllerAnimated(true, completion: nil)
            save()
        }
    }


    //MARK: - Keyboard Handling

    func keyboardWillShow(notification: NSNotification) {
        if bottomtextField.isFirstResponder() {
            var shiftUp = getKeyboardHeight(notification)
            containerToTopConstraint.constant = -shiftUp
            containerToBottomConstraint.constant = shiftUp
            UIView.animateWithDuration(0.25, animations: { () -> Void in
                self.view.layoutIfNeeded()
            })
            hideNavAndToolBars()
        }
    }
    func keyboardWillHide(notification: NSNotification) {
        if bottomtextField.isFirstResponder() {
            containerToTopConstraint.constant = 0
            containerToBottomConstraint.constant = 0
            UIView.animateWithDuration(0.25, animations: { () -> Void in
                self.view.layoutIfNeeded()
            })
            showNavAndToolBars()
        }
    }
    func unsubscribeFromKeyboardNotifications() {
            NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    func subscribeToKeyboardNotifications() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }
    func getKeyboardHeight(notification: NSNotification) -> CGFloat {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as NSValue // of CGRect
        return keyboardSize.CGRectValue().height
    }




    //MARK: - The After Math

    func save() {
        //Create the meme
        var meme = MeMe(text: bottomtextField.text!, image: imageView.image!, memedImage: generateMemedImage())
        // Add it to the memes array in the Application Delegate
        (UIApplication.sharedApplication().delegate as
            AppDelegate).memes.append(meme)
    }

    func generateMemedImage() -> UIImage {
        // TODO: Hide toolbar and navbar

        // render view to an image
        UIGraphicsBeginImageContext(self.view.bounds.size)
        self.view.drawViewHierarchyInRect(self.view.bounds, afterScreenUpdates: true)
        let memedImage : UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        // TODO:  Show toolbar and navbar
        return memedImage
    }

    //MARK: - Tap on img Gesture

    @IBAction func imageviewdidTapped(sender: UITapGestureRecognizer) {
        reverseTheVisibilityOfToolBars()
        upperTextField.resignFirstResponder()
        bottomtextField.resignFirstResponder()
    }

    func reverseTheVisibilityOfToolBars() {
        if upperNavBar.hidden {
            showNavAndToolBars()
        } else {
            hideNavAndToolBars()
        }
    }
    func hideNavAndToolBars() {
        upperNavBar.hidden = true
        bottomToolBar.hidden = true
    }
    func showNavAndToolBars() {
        upperNavBar.hidden = false
        bottomToolBar.hidden = false
    }


}