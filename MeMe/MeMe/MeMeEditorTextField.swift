//
//  MeMeEditorTextField.swift
//  MeMe
//
//  Created by Moath_Othman on 4/12/15.
//  Copyright (c) 2015 Moba. All rights reserved.
//

struct  TexTConstants {
    static var TOP = "TOP"
    static var BOTTOM = "BOTTOM"
    static var NONE = ""
}
import UIKit

@IBDesignable class MeMeEditorTextField: UITextField,UITextFieldDelegate {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupTextAttributes()
        self.delegate = self
    }
    func setupTextAttributes() {

        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = NSTextAlignment.Center

        let memeTextAttributes = [
            NSParagraphStyleAttributeName : paragraphStyle,
            NSStrokeColorAttributeName : UIColor.blackColor() ,
            NSForegroundColorAttributeName : UIColor.whiteColor(),
            NSFontAttributeName : UIFont(name: "HelveticaNeue-CondensedBlack", size: 36)!,
            NSStrokeWidthAttributeName : -4,
        ]

        self.defaultTextAttributes = memeTextAttributes
    }

    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {

        return true
    }
    func textFieldDidBeginEditing(textField: UITextField) {
        if textField.text == TexTConstants.TOP || textField.text == TexTConstants.BOTTOM {
            //bottom
            textField.text = TexTConstants.NONE

        }
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField.text == TexTConstants.NONE  {
            if textField.tag == 1 {
                textField.text = TexTConstants.TOP
            }else {
                textField.text = TexTConstants.BOTTOM

            }
            //bottom

        }
        textField.resignFirstResponder()
        return true
    }




}
