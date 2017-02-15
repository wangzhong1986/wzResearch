//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var window = UIWindow.init(frame:CGRect.init(x: 0, y: 0, width: 320, height: 480))

let view = UIView.init(frame:CGRect.init(x: 0, y: 0, width: 100, height: 100))
view.backgroundColor = UIColor.black
window.addSubview(view)
