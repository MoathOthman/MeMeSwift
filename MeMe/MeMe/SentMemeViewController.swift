//
//  SentMemeViewController.swift
//  MeMe
//
//  Created by Moath_Othman on 4/11/15.
//  Copyright (c) 2015 Moba. All rights reserved.
//

import UIKit

class SentMemeViewController: UITabBarController {
    var memes: [MeMe]!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        let object = UIApplication.sharedApplication().delegate as AppDelegate
        let appDelegate = object as AppDelegate
            memes = appDelegate.memes

    }



}
