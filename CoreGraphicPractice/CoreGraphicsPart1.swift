//
//  CoreGraphicsPart1.swift
//  CoreGraphicPractice
//
//  Created by Mohsin on 08/07/2015.
//  Copyright (c) 2015 PanaCloud. All rights reserved.
//

// http://www.raywenderlich.com/90690/modern-core-graphics-with-swift-part-1



import UIKit

class CoreGraphicsPart1: UIViewController {

    //Counter outlets
    @IBOutlet weak var counterView: MyCounterView!
    @IBOutlet weak var counterLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        counterLabel.text = String(counterView.counter)

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
    
    @IBAction func click(sender: UIButton) {
        
            // for plus
        if sender.tag == 0  && counterView.counter < 8{
            counterView.counter++
        }
            // for mines
        else if  sender.tag == 1 && counterView.counter > 0{
            counterView.counter--
        }

        counterLabel.text = String(counterView.counter)

        
    }

}


@IBDesignable
class MyButtonView: UIButton {
    
    @IBInspectable var fillColor: UIColor = UIColor.greenColor()
    @IBInspectable var isAddButton: Bool = true
    
    
    override func drawRect(rect: CGRect) {
        
        let circle = UIBezierPath(ovalInRect: rect)
        
        self.fillColor.setFill()
        
        circle.fill()
        
        
        //set up the width and height variables
        //for the horizontal stroke
        let plusHeight: CGFloat = 3.0
        let plusWidth: CGFloat = min(bounds.width, bounds.height) * 0.6
        
        //create the path
        var plusPath = UIBezierPath()
        
        //set the path's line width to the height of the stroke
        plusPath.lineWidth = plusHeight
        
        //move the initial point of the path
        //to the start of the horizontal stroke
        plusPath.moveToPoint(CGPoint(
            x:bounds.width/2 - plusWidth/2 + 0.5,
            y:bounds.height/2 + 0.5))
        
        //add a point to the path at the end of the stroke
        plusPath.addLineToPoint(CGPoint(
            x:bounds.width/2 + plusWidth/2 + 0.5,
            y:bounds.height/2 + 0.5))
        
        //set the stroke color
        UIColor.whiteColor().setStroke()
        
        //draw the stroke
        plusPath.stroke()
        
        if isAddButton {
            plusPath.removeAllPoints()
            
            plusPath.moveToPoint(CGPoint(x: bounds.height/2 + 0.5, y: bounds.width/2 - plusWidth/2 + 0.5))
            
            plusPath.addLineToPoint(CGPoint(x: bounds.height/2 + 0.5, y: bounds.width/2 + plusWidth/2 + 0.5))
            
            plusPath.stroke()
        }
 
        
    }
    
}




// constant value

let NoOfGlasses = 8
let π:CGFloat = CGFloat(M_PI)


@IBDesignable class MyCounterView: UIView {
    
    @IBInspectable var counter: Int = 5{
        didSet{
            self.setNeedsDisplay()
        }
    }
    @IBInspectable var outlineColor: UIColor = UIColor.blueColor()
    @IBInspectable var counterColor: UIColor = UIColor.orangeColor()
    
    override func drawRect(rect: CGRect) {
        
        // 1
        let center = CGPoint(x:bounds.width/2, y: bounds.height/2)
        
        // 2
        let radius: CGFloat = max(bounds.width, bounds.height)
        
        // 3
        let arcWidth: CGFloat = 76
        
        // 4
        let startAngle: CGFloat = 3 * π / 4
        let endAngle: CGFloat = π / 4
        
        // 5
        var path = UIBezierPath(arcCenter: center,
            radius: radius/2 - arcWidth/2,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: true)
        
        // 6
        path.lineWidth = arcWidth
        counterColor.setStroke()
        path.stroke()
        
        
        
        
        //Draw the outline
        
        //1 - first calculate the difference between the two angles
        //ensuring it is positive
        let angleDifference: CGFloat = 2 * π - startAngle + endAngle
        
        //then calculate the arc for each single glass
        let arcLengthPerGlass = angleDifference / CGFloat(NoOfGlasses)
        
        //then multiply out by the actual glasses drunk
        let outlineEndAngle = arcLengthPerGlass * CGFloat(counter) + startAngle
        
        //2 - draw the outer arc
        var outlinePath = UIBezierPath(arcCenter: center,
            radius: bounds.width/2 - 2.5,
            startAngle: startAngle,
            endAngle: outlineEndAngle,
            clockwise: true)
        
        //3 - draw the inner arc
        outlinePath.addArcWithCenter(center,
            radius: bounds.width/2 - arcWidth + 2.5,
            startAngle: outlineEndAngle,
            endAngle: startAngle,
            clockwise: false)
        
        //4 - close the path
        outlinePath.closePath()
        
        outlineColor.setStroke()
        outlinePath.lineWidth = 5.0
        outlinePath.stroke()
        
    }
}