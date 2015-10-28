//
//  SentMeMeCollectionViewController.swift
//  MeMe
//
//  Created by Moath_Othman on 4/15/15.
//  Copyright (c) 2015 Moba. All rights reserved.
//

import UIKit

let reuseIdentifier = "MemeCell"

class SentMeMeCollectionViewController: UICollectionViewController {

    var memes: [MeMe]!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        memes = MeMes.memes
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as UICollectionViewCell
        let imageView = cell.contentView.viewWithTag(2) as! UIImageView
        let _meme     = memes[indexPath.row] as MeMe
        imageView.image = _meme.memedImage
        // Configure the cell

        return cell
    }

    // MARK: UICollectionViewDelegate
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let _meme     = memes[indexPath.row] as MeMe
        let imageToBePassed = _meme.memedImage
        let detailViewController = self.storyboard?.instantiateViewControllerWithIdentifier("DetailViewController") as! DetailViewController
        detailViewController.image = imageToBePassed

        self.navigationController?.pushViewController(detailViewController, animated: true)

    }


}
