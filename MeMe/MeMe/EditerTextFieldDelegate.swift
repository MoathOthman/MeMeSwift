//
//  EditerTextFieldDelegate.swift
//  MeMe
//
//  Created by Moath_Othman on 4/12/15.
//  Copyright (c) 2015 Moba. All rights reserved.
//

import UIKit

class EditerTextFieldDelegate:NSObject, UITextFieldDelegate {

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
