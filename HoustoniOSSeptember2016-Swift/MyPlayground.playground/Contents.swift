//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

class ShoppingListTableViewController :UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

// Core Graphics 

// GraphView.swift
class GraphView : UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func draw(_ rect: CGRect) {
        
        // circle
        UIColor.green.setFill()
        UIColor.blue.setStroke()
        let circle = UIBezierPath(ovalIn: CGRect(x: 100, y: 100, width: 100, height: 100))
        circle.lineWidth = 10
        
        circle.stroke()
        circle.fill()
        circle.close()
        
        // line
        UIColor.red.setStroke()
        let line = UIBezierPath()
        line.move(to: CGPoint(x: 0, y: 0))
        line.addLine(to: CGPoint(x: 100, y: 100))
        line.addLine(to: CGPoint(x: 200, y: 300))
        line.lineWidth = 10
        
        line.close()
        line.stroke()
        
        // rectangles 
        UIColor.purple.setFill()
        let rectangle1 = UIBezierPath(rect: CGRect(x: 10, y: 200, width: 20, height: 200))
        
        rectangle1.fill()
        
        let rectangle2 = UIBezierPath(rect: CGRect(x: 50, y: 300, width: 20, height: 100))
        
        rectangle2.fill()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// ViewController.swift
// self.view
let container = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 480))

let graphView = GraphView()
graphView.frame = CGRect(x: 0, y: 0, width: 320, height: 480)

graphView.backgroundColor = UIColor.yellow
container.addSubview(graphView)

container.backgroundColor = UIColor.lightGray

let shoppingListTVC = ShoppingListTableViewController(style: .plain)
shoppingListTVC.view.frame = CGRect(x: 0, y: 0, width: 320, height: 480)

PlaygroundPage.current.liveView = container

// Swift 3.0 Named Parameters

// add:(int) firstNumber foo:(int) secondNumber

// [self add:12 foo:23];

class Bank {
    
}

func transferBalance(_ from :Bank, _ to :Bank) {
    
}




















