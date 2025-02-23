//
//  UiView+Extension.swift
//  StarWarsBlastersTournament
//
//  Created by Soumya Ranjan Mishra on 11/07/24.
//

import UIKit

public extension UIColor {
    
    convenience init(hex: String) {
        let scanStr = hex.trimmingCharacters(in: .whitespaces).uppercased()
        
        let scanner = Scanner(string: scanStr)
        if scanStr.hasPrefix("#") {
            scanner.currentIndex = scanner.string.index(scanner.string.startIndex, offsetBy: 1)
        }
        
        var rgbValue: UInt32 = 0
        scanner.scanHexInt32(&rgbValue)
        
        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0))
    }
}


public extension UIView {
    
    func loadViewFromNib(nibName: String) -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    func setGradientBackground(isHorizontal: Bool = false, x: NSNumber, isNavColor: Bool) {
        let bgColorLeft = UIColor(red: 0.88, green: 0.15, blue: 0.35, alpha: 1.00).cgColor
        let bgColorRight = UIColor(red: 0.05, green: 0.14, blue: 0.35, alpha: 1.00).cgColor
        let bgNavColorLeft = UIColor(red: 0.8314, green: 0.2118, blue: 0.3333, alpha: 1.00).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [isNavColor == false ? bgColorLeft : bgNavColorLeft, bgColorRight]
        gradientLayer.locations = [x, 1.0]
        gradientLayer.frame = bounds
        
        if isHorizontal {
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        }
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func applyGradient(colours: [UIColor], isHorizontal: Bool = false) {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        if isHorizontal {
            // Set different colors for the left and right sides
            gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        }
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func addBottomBorderWithColor1(color: UIColor, width: CGFloat, widthValue: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width - widthValue, height: width)
        self.layer.addSublayer(border)
    }
    
    func addCornerRadius(radius: CGFloat = 10) {
        self.layer.cornerRadius = radius // Adjust the value as needed
        self.layer.masksToBounds = true
    }
    
    func addCornerRadiusWithBorderColor(radius: CGFloat = 10 ,color: UIColor,widthValue: CGFloat) {
            self.layer.cornerRadius = radius
            self.layer.masksToBounds = true
            self.layer.borderColor = color.cgColor
            self.layer.borderWidth = widthValue
        }
    
    func applyBottomCornerRadius(radius: CGFloat) {
        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(
            roundedRect: CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height),
            byRoundingCorners: [.bottomLeft, .bottomRight],
            cornerRadii: CGSize(width: radius, height: radius)
        ).cgPath
        layer.mask = maskLayer
    }
    
    func setSizeConstraint(size: CGSize) {
        self.widthAnchor.constraint(equalToConstant: size.width).isActive = true
        self.heightAnchor.constraint(equalToConstant: size.height).isActive = true
    }
    
    func fixInView(_ container: UIView!,_ top: Float,_ height: Float) -> Void{
        self.translatesAutoresizingMaskIntoConstraints = false;
        self.frame = container.frame;
        container.addSubview(self);
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1.0, constant: CGFloat(top)).isActive = true
        
        let heightConstraint = NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: CGFloat(height))
        self.addConstraints([heightConstraint])

    }
}

