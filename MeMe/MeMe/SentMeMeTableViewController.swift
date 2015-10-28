//
//  SentMeMeTableViewController.swift
//  MeMe
//
//  Created by Moath_Othman on 4/15/15.
//  Copyright (c) 2015 Moba. All rights reserved.
//

import UIKit



class SentMeMeTableViewController: UITableViewController {
    var memes: [MeMe]!

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        memes = MeMes.memes
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MemeCell", forIndexPath: indexPath) as UITableViewCell
        let imageView   = cell.contentView.viewWithTag(2) as! UIImageView
        let memedText   = cell.contentView.viewWithTag(1) as! UILabel
        let _meme       = memes[indexPath.row] as MeMe
        imageView.image = _meme.memedImage
        memedText.text  = _meme.text

        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let _meme           = memes[indexPath.row] as MeMe
        let imageToBePassed = _meme.memedImage
        let detailViewController    = self.storyboard?.instantiateViewControllerWithIdentifier("DetailViewController") as! DetailViewController
        detailViewController.image  = imageToBePassed

        self.navigationController?.pushViewController(detailViewController, animated: true)

    }

}
