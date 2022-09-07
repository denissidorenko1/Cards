//
//  Shapes.swift
//  Cards
//
//  Created by Denis on 07.09.2022.
//

import Foundation
import UIKit

protocol ShapeLayerProtocol : CAShapeLayer {
    init(size: CGSize, fillColor: CGColor)
}

extension ShapeLayerProtocol {
    init(){
        fatalError("init() не может быть использован для создания экземпляра")
    }
}


class BackSideCircle: CAShapeLayer, ShapeLayerProtocol {
    required init(size: CGSize, fillColor: CGColor) {
        super.init()
        
        let path = UIBezierPath()
        
        for _ in 1...15 {
            let randomX = Int.random(in: 0...Int(size.width))
            let randomY = Int.random(in: 0...Int(size.height))
            let center = CGPoint(x: randomX, y: randomY)
            path.move(to: center)
            path.addArc(withCenter: center, radius: CGFloat.random(in: 5...25), startAngle: 0, endAngle: .pi*2, clockwise: true)
        }
        self.path = path.cgPath
        self.strokeColor = fillColor
        self.fillColor = fillColor
        self.lineWidth = 1
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class BackSideLine: CAShapeLayer, ShapeLayerProtocol {
    required init(size: CGSize, fillColor: CGColor) {
        super.init()
        
        let path = UIBezierPath()
        
        for _ in 1...15 {
            let randomStartX = Int.random(in: 0...Int(size.width))
            let randomStartY = Int.random(in: 0...Int(size.height))
            
            let randomEndX = Int.random(in: 0...Int(size.width))
            let randomEndY = Int.random(in: 0...Int(size.height))
            
            path.move(to: CGPoint(x: randomStartX, y: randomStartY))
            path.addLine(to: CGPoint(x: randomEndX, y: randomEndY))
        }
        
        self.path = path.cgPath
        self.strokeColor = fillColor
        self.lineWidth = 3
        self.lineCap = .round
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class CircleShape: CAShapeLayer, ShapeLayerProtocol {
    required init(size: CGSize, fillColor: CGColor) {
        super.init()
        // расчет радиуса круга
        let radius = ([size.width, size.height].min() ?? 0) / 2
        let centerX = size.width / 2
        let centerY = size.height / 2
        // отрисовка круга
        let path = UIBezierPath(arcCenter: CGPoint(x: centerX, y: centerY), radius: radius, startAngle: 0, endAngle: .pi*2, clockwise: true)
        path.close()
        // инициализация пути
        self.path = path.cgPath
        self.fillColor = fillColor
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class SquareShape: CAShapeLayer, ShapeLayerProtocol {
    required init(size: CGSize, fillColor: CGColor) {
        super.init()
        // вычисляем размеры стороны
        // мб сделать выброс ошибки если width != height?
        let side = ([size.width, size.height].min() ?? 0)
        let rect = CGRect(x: 0, y: 0, width: side, height: side)
        let path = UIBezierPath(rect: rect)
        path.close()
        // инициализация пути
        self.path = path.cgPath
        self.strokeColor = fillColor
        self.lineWidth = 5
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CrossShape: CAShapeLayer, ShapeLayerProtocol {
    required init(size: CGSize, fillColor: CGColor) {
        super.init()
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: size.width, y: size.height))
        path.move(to: CGPoint(x: 0, y: size.height))
        path.addLine(to: CGPoint(x: size.width, y: 0))
        self.path = path.cgPath
        self.strokeColor = fillColor
        self.lineWidth = 5
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class FillShape: CAShapeLayer, ShapeLayerProtocol {
    required init(size: CGSize, fillColor: CGColor) {
        super.init()
        
        let path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        self.path = path.cgPath
        self.fillColor = fillColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

