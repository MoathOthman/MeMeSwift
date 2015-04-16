//
//  MeMeEditorTextField.swift
//  MeMe
//
//  Created by Moath_Othman on 4/12/15.
//  Copyright (c) 2015 Moba. All rights reserved.
//

import UIKit

class MeMeEditorTextField: UITextField,UITextFieldDelegate {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupTextAttributes()
        self.delegate = self
    }
    func setupTextAttributes() {

        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = NSTextAlignment.Center

        let memeTextAttributes = [
            NSStrokeColorAttributeName : UIColor.blackColor() ,
            NSForegroundColorAttributeName : UIColor.whiteColor(),
            NSFontAttributeName : UIFont(name: "HelveticaNeue-CondensedBlack", size: 36)!,
            NSStrokeWidthAttributeName : 4,
            NSParagraphStyleAttributeName : paragraphStyle
        ]

        self.defaultTextAttributes = memeTextAttributes
    }

    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {

        return true
    }
    func textFieldDidBeginEditing(textField: UITextField) {
        if textField.text == "TOP" || textField.text == "BOTTOM" {
            //bottom
            textField.text = ""

        }
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField.text == ""  {
            if textField.tag == 1 {
                textField.text = "TOP"
            }else {
                textField.text = "BOTTOM"

            }
            //bottom

        }
        textField.resignFirstResponder()
        return true
    }

}
