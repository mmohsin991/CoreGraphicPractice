//
//  ImageViewVC.swift
//  CoreGraphicPractice
//
//  Created by Mohsin on 05/07/2015.
//  Copyright (c) 2015 PanaCloud. All rights reserved.
//

import UIKit

class ImageViewVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
        
        let background = UIImage(named:"apple")!
        
        let edge = UIEdgeInsetsMake(background.size.height/2.0 , background.size.width/2.0 , background.size.height/2.0 , background.size.width/2.0 )
        
        let backgroundTiled = background.resizableImageWithCapInsets(
            edge, resizingMode: UIImageResizingMode.Stretch)
        
        
        self.imageView.image = backgroundTiled
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
