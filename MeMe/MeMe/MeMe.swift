//
//  MeMe.swift
//  MeMe
//
//  Created by Moath_Othman on 4/11/15.
//  Copyright (c) 2015 Moba. All rights reserved.
//

import UIKit

struct MeMe {
    private  var bottomText: String?
    private  var topText: String?
    var image: UIImage?
    var memedImage: UIImage
    var text: String {
        get {
            return bottomText! + "," + topText!
        }
    }
    init(bottomText: String?,topText: String? , image : UIImage?, memedImage: UIImage) {

        self.bottomText = bottomText
        self.topText    = topText
        self.image      = image
        self.memedImage = memedImage

    }
}

