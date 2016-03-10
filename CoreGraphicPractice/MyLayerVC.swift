//
//  MyLayerVC.swift
//  Animations
//
//  Created by Mohsin on 10/07/2015.
//  Copyright (c) 2015 PanaCloud. All rights reserved.
//

import UIKit

class MyLayerVC: UIViewController {

    @IBOutlet weak var myView: UIView!
        

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        
        
        
//        let lay1 = CALayer()
//        lay1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1).CGColor
//        lay1.frame = CGRectMake(113, 111, 132, 194)
//        self.view.layer.addSublayer(lay1)
//        let lay2 = CALayer()
//        lay2.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1).CGColor
//        lay2.frame = CGRectMake(41, 56, 132, 194)
//        lay1.addSublayer(lay2)
//        let lay3 = CALayer()
//        lay3.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1).CGColor
//        lay3.frame = CGRectMake(43, 197, 160, 230)
//        self.view.layer.addSublayer(lay3)
        
        
        
        let myLayer = MyLayer()
        myLayer.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        
        
        
        myLayer.anchorPoint = CGPointMake(1,0.5)
        //myLayer.position = CGPointMake( self.myView.layer.bounds.maxX, self.myView.layer.bounds.midY)
        myLayer.transform = CATransform3DMakeRotation(CGFloat(M_PI)/4.0, 0, 1, 0)
        
        // apply the distance-mapping transform.
        var transform = CATransform3DIdentity
        transform.m34 = -1.0/1000.0
        self.myView.layer.sublayerTransform = transform
        
        
        
        
        myLayer.setNeedsDisplay()
        self.myView.layer.addSublayer(myLayer)
        
        
        
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


class MyLayer: CALayer {
    
    
    
    override func drawInContext(ctx: CGContext) {
            print(ctx)
//            
//            let colors = [UIColor.greenColor().CGColor, UIColor.redColor().CGColor]
//            
//            //2 - set up the color space
//            let colorSpace = CGColorSpaceCreateDeviceRGB()
//            
//            //3 - set up the color stops (0.....1) colors locations == # of colors
//            let colorLocations:[CGFloat] = [0.0, 1.0]
//            
//            //4 - create the gradient
//            let gradient = CGGradientCreateWithColors(colorSpace,
//                colors,
//                colorLocations)
//            
//            //5 - draw the gradient
//            var startPoint = CGPoint.zeroPoint
//            var endPoint = CGPoint(x:0, y:self.bounds.height)
//            CGContextDrawLinearGradient(ctx,
//                gradient,
//                startPoint,
//                endPoint,
//                0)
//
//        
//            self.contentsGravity = kCAGravityCenter
//            
//            
            
            
            
            
        // the gradient
        
        
        let center = CGPoint(x: self.bounds.origin.x + self.bounds.size.width/2, y: self.bounds.origin.y + self.bounds.size.height/2)
        
        let g = CAGradientLayer()
        g.contentsScale = UIScreen.mainScreen().scale
        g.frame = self.bounds
        g.colors = [
            UIColor.blackColor().CGColor as AnyObject,
            UIColor.redColor().CGColor as AnyObject
        ]
        g.locations = [0.0,1.0]
        self.addSublayer(g)
        // the circle
        let circle = CAShapeLayer()
        circle.contentsScale = UIScreen.mainScreen().scale
        circle.lineWidth = 2.0
        circle.fillColor = UIColor(red:0.9, green:0.95, blue:0.93, alpha:0.9).CGColor
        circle.strokeColor = UIColor.grayColor().CGColor
        let p = CGPathCreateMutable()
        CGPathAddEllipseInRect(p, nil, CGRectInset(self.bounds, 3, 3))
        circle.path = p
        circle.bounds = self.bounds
        circle.position = center
        
        self.addSublayer(circle)
        
        // the four cardinal points
        let pts = "NESW"
        for (ix,c) in pts.characters.enumerate() {
            let t = CATextLayer()
            t.contentsScale = UIScreen.mainScreen().scale
            t.string = String(c)
            t.bounds = CGRectMake(0,0,40,40)
            t.position = center
            let vert = circle.bounds.midY / t.bounds.height
            t.anchorPoint = CGPointMake(0.5, vert)
            // println(t.anchorPoint)
            t.alignmentMode = kCAAlignmentCenter
            t.foregroundColor = UIColor.blackColor().CGColor
            t.setAffineTransform(
                CGAffineTransformMakeRotation(CGFloat(ix)*CGFloat(M_PI)/2.0))
            circle.addSublayer(t)
        }
        // the arrow
        let arrow = MyArrow()
        arrow.contentsScale = UIScreen.mainScreen().scale
        arrow.backgroundColor = UIColor.blackColor().CGColor
        arrow.bounds = CGRectMake(0, 0, 10, 80)
        arrow.position = center
        // anchorPoint value from 0.....1
        arrow.anchorPoint = CGPointMake(0.5, 0.0)
        arrow.setNeedsDisplay()
    
    
    
//        arrow.setAffineTransform(CGAffineTransformMakeRotation(CGFloat(M_PI)/5.0))
        
        // same as above traform : by default CGTranformation is on Z-axis
        // M_PI == 180 Deg
        
        arrow.transform = CATransform3DMakeRotation(CGFloat(M_PI), 0, 0, 1)
        self.addSublayer(arrow)
    
    
        
    }
    
    

}



class MyArrow: CALayer {
    
    override func drawInContext(ctx: CGContext) {
        
        CGContextSetFillColorWithColor(ctx, UIColor.redColor().CGColor)

        CGContextFillRect(ctx, CGRect(x: 0, y: 70, width: 10, height: 10))
        
    
    }
    
}



class MyButton: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.layer.cornerRadius = self.bounds.height/2

        self.layer.shadowColor = UIColor.grayColor().CGColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowOpacity = 5.0
        self.layer.shadowRadius = 5.0
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        
        self.layer.shadowRadius = 10.0

        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesEnded(touches, withEvent: event)
        
        self.layer.shadowRadius = 5.0

    }
}


class MyTwitterView: UIView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let imageView = UIImageView(image: UIImage(named: "TwitterLogo")! )
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
       // self.addSubview(imageView)

       self.layer.mask = imageView.layer
       //self.layer.masksToBounds = true
        
    }
    
    
    
    
}

