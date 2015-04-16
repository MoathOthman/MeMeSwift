//
//  DetailViewController.swift
//  MeMe
//
//  Created by Moath_Othman on 4/16/15.
//  Copyright (c) 2015 Moba. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var image = UIImage()

    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
