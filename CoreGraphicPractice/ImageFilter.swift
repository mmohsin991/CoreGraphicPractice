//
//  ImageFilter.swift
//  CoreGraphicPractice
//
//  Created by Mohsin on 07/07/2015.
//  Copyright (c) 2015 PanaCloud. All rights reserved.
//

import UIKit

class ImageFilter: UIViewController {
    
    // all filters
    //https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorInvert
    
    // tutorial
    // http://www.raywenderlich.com/76285/beginning-core-image-swift
    
    

    @IBOutlet weak var inputImg: UIImageView!
    
    @IBOutlet weak var outputImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let beginImage = CIImage(image: self.inputImg.image)
        
        
        // eg filter 1
        let invert = CIFilter(name:"CIColorInvert")
        invert.setValue(beginImage, forKey: "inputImage")
        
        
        // eg filter 2
        let vignette = CIFilter(name:"CIVignette")
        vignette.setValue(beginImage, forKey: "inputImage")
        vignette.setValue(0.4 * 2, forKey:"inputIntensity")
        vignette.setValue(0.6 * 30, forKey:"inputRadius")

        
        // show the output image
        self.outputImg.image = UIImage(CIImage: vignette.outputImage)
        
        
    }
    
    
    
    

    // helper function
    func printAllFilters() {
        let properties = CIFilter.filterNamesInCategory(kCICategoryBuiltIn)
        println(properties)
        
        for filterName: AnyObject in properties {
            let fltr = CIFilter(name:filterName as! String)
            println(fltr.attributes())
        }
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
