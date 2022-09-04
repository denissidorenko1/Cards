//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import CoreGraphics

private func getPath() -> UIBezierPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 10, y: 10))
    path.addCurve(to: CGPoint(x: 200, y: 200),
    controlPoint1: CGPoint(x: 200, y: 20), controlPoint2: CGPoint(x: 20, y: 200))
    return path
}

private func createBezier(on view: UIView) {
    let shapeLayer = CAShapeLayer()
    view.layer.addSublayer(shapeLayer)
    shapeLayer.strokeColor = UIColor.gray.cgColor
    shapeLayer.lineWidth = 5
    shapeLayer.path = getPath().cgPath
    shapeLayer.fillColor = UIColor.systemGreen.cgColor
    shapeLayer.lineCap = .round
    shapeLayer.lineJoin = .round
//    shapeLayer.lineDashPattern = [10]
}

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        createBezier(on: view)
        self.view = view
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
