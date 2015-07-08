//
//  PathsAndShapesVC.swift
//  CoreGraphicPractice
//
//  Created by Mohsin on 08/07/2015.
//  Copyright (c) 2015 PanaCloud. All rights reserved.
//

import UIKit

class PathsAndShapesVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        

        
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


//@IBDesignable
class MyView: UIView{
    override func drawRect(rect: CGRect) {
//        
//         // using Core Graphics
//        
//        // obtain the current graphics context
//        let con = UIGraphicsGetCurrentContext()
//        // draw a black (by default) vertical line, the shaft of the arrow
//        CGContextMoveToPoint(con, 100, 100)
//        CGContextAddLineToPoint(con, 100, 19)
//        CGContextSetLineWidth(con, 20)
//        CGContextStrokePath(con)
//        // draw a red triangle, the point of the arrow
//        CGContextSetFillColorWithColor(con, UIColor.redColor().CGColor)
//        CGContextMoveToPoint(con, 80, 25)
//        CGContextAddLineToPoint(con, 100, 0)
//        CGContextAddLineToPoint(con, 120, 25)
//        CGContextFillPath(con)
//        // snip a triangle out of the shaft by drawing in Clear blend mode
//        CGContextMoveToPoint(con, 90, 101)
//        CGContextAddLineToPoint(con, 100, 90)
//        CGContextAddLineToPoint(con, 110, 101)
//        CGContextSetBlendMode(con, kCGBlendModeClear)
//        CGContextFillPath(con)
        
        
// using UIKit
        let p = UIBezierPath()
        // shaft
        p.moveToPoint(CGPointMake(100,100))
        p.addLineToPoint(CGPointMake(100, 19))
        p.lineWidth = 20
        p.stroke()
        // point
        UIColor.redColor().set()
        p.removeAllPoints()
        p.moveToPoint(CGPointMake(80,25))
        p.addLineToPoint(CGPointMake(100, 0))
        p.addLineToPoint(CGPointMake(120, 25))
        p.fill()

        // snip
        p.removeAllPoints()
        
        p.moveToPoint(CGPointMake(90,101))
        p.addLineToPoint(CGPointMake(100, 90))
        p.addLineToPoint(CGPointMake(110, 101))
        //p.fillWithBlendMode(kCGBlendModeClear, alpha:1.0)
        p.fill()
        
        
       

//        // create the pattern image tile
//        UIGraphicsBeginImageContextWithOptions(CGSizeMake(4,4), false, 0)
//        let imcon = UIGraphicsGetCurrentContext()
//        CGContextSetFillColorWithColor(imcon, UIColor.redColor().CGColor)
//        CGContextFillRect(imcon, CGRectMake(0,0,4,4))
//        CGContextSetFillColorWithColor(imcon, UIColor.blueColor().CGColor)
//        CGContextFillRect(imcon, CGRectMake(0,0,4,2))
//        let stripes = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        // paint the point of the arrow with it
//        let stripesPattern = UIColor(patternImage:stripes)
//        stripesPattern.setFill()
//        let p = UIBezierPath()
//        p.moveToPoint(CGPointMake(80,25))
//        p.addLineToPoint(CGPointMake(100,0))
//        p.addLineToPoint(CGPointMake(120,25))
//        p.fill()
        
    }
    
    
}


