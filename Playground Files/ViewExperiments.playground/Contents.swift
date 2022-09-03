//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import CoreGraphics

class MyViewController : UIViewController {
    
    
    private func setViews(inner moveView: UIView, outer baseView: UIView) {
        // размеры вложенного
        let moveViewHeight = moveView.frame.height
        let moveViewWidth = moveView.frame.width
        // размеры родительского
        let baseViewHeight = baseView.bounds.height
        let baseViewWidth = baseView.bounds.width
        
        let coordX = (baseViewWidth - moveViewWidth) / 2
        let coordY = (baseViewHeight - moveViewHeight) / 2
        
        moveView.frame.origin = CGPoint(x: coordX, y: coordY)
    }
    
    private func set(inner moveView: UIView, outer baseView: UIView){
        moveView.center = CGPoint(x: baseView.bounds.midX, y: baseView.bounds.midY)
    }
    
    
    private func getPinkSquareView() -> UIView {
        let viewFrame = CGRect(x: 50, y: 300, width: 100, height: 100)
        let view = UIView(frame: viewFrame)
        view.backgroundColor = .systemPink
        view.layer.borderWidth = 5
        view.layer.borderColor = UIColor.yellow.cgColor
        view.layer.cornerRadius = 15
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 10
        view.layer.shadowOffset = CGSize(width: 5, height: 5)
        
        
        let layer = CALayer()
        layer.backgroundColor = UIColor.black.cgColor
        layer.frame = CGRect(x: 10, y: 10, width: 20, height: 20)
        layer.cornerRadius = 10
        view.layer.addSublayer(layer)
        
//        print(view.frame)
//        // поворот представления
//        view.transform = CGAffineTransform(rotationAngle: .pi/4)
//        // вывод на консоль размеров представления
//        print(view.frame)
        
//        view.transform = CGAffineTransform(scaleX: 1.5, y: 0.7)
        
//        view.transform = CGAffineTransform(translationX: 100, y: 5)
        
//        view.transform = CGAffineTransform(rotationAngle: .pi/3).scaledBy(x: 2, y:0.8).translatedBy(x: 50, y: 50)
        
//        view.transform = CGAffineTransform.identity
        
        return view
    }
    
    private func getWhiteSquareView() -> UIView {
        let square = CGRect(x: 100, y: 150, width: 50, height: 50)
        let squareView = UIView(frame: square)
        squareView.backgroundColor = .white
        
        return squareView
    }
    
    
    private func getRedSquareView() -> UIView {
        let square = CGRect(x: 100, y: 150, width: 250, height: 250)
        let squareView = UIView(frame: square)
        squareView.backgroundColor = .red
        squareView.clipsToBounds = true
        return squareView
    }
    
    private func getGreenSquareView() -> UIView {
        let square = CGRect(x: 100, y: 100, width: 180, height: 180)
        let squareView = UIView(frame: square)
        squareView.backgroundColor = .green
        return squareView
    }
    
    
    private func getRootView() -> UIView {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }
    
    
    
    func setupView(){
        self.view = getRootView()
        let redView = getRedSquareView()
        let greenView = getGreenSquareView()
        let whiteView = getWhiteSquareView()
        
        // поворот красного представления
        redView.transform = CGAffineTransform(rotationAngle: .pi/4)
        set(inner: greenView, outer: redView)
        whiteView.center = greenView.center
        // ...
        
        self.view.addSubview(redView)
        redView.addSubview(greenView)
        redView.addSubview(whiteView)
        
        let pinkView = getPinkSquareView()
        self.view.addSubview(pinkView)
        
    }
    
    override func loadView() {
        setupView()
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
