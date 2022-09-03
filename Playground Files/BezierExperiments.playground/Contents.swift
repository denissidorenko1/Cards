//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import CoreGraphics

private func getPath() -> UIBezierPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 50, y: 50))
    path.addLine(to: CGPoint(x: 150, y: 50))
    path.addLine(to: CGPoint(x: 150, y: 150))
    path.close()
//    path.addLine(to: CGPoint(x: 350, y: 150))
//    path.addLine(to: CGPoint(x: 250, y: 50))
    return path
}

private func createBezier(on view: UIView) {
    let shapeLayer = CAShapeLayer()
    view.layer.addSublayer(shapeLayer)
    shapeLayer.strokeColor = UIColor.red.cgColor
    shapeLayer.lineWidth = 5
    shapeLayer.path = getPath().cgPath
    shapeLayer.fillColor = UIColor.green.cgColor
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
