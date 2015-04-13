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
        let memeTextAttributes = [
            NSStrokeColorAttributeName : UIColor.blackColor() ,
            NSForegroundColorAttributeName : UIColor.orangeColor(),             NSFontAttributeName : UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
            NSStrokeWidthAttributeName : 1,
        ]

        self.defaultTextAttributes = memeTextAttributes
        self.delegate = self
    }


    func textFieldDidBeginEditing(textField: UITextField) {
        if textField.text == "TOP" || textField.text == "BOTTOM" {
            //bottom
            textField.text = ""

        }
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
