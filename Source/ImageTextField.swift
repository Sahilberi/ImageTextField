//
//  ImageTextField.swift
//  ImageTextField
//
//  Created by Sahil on 22/02/17.
//  Copyright © 2017 SahilBeri. All rights reserved.
//

import UIKit

@IBDesignable
class ImageTextField: UITextField {
 
  var textFieldBorderStyle: UITextBorderStyle = .roundedRect
  
  // Provides left padding for image
  override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
    var textRect = super.leftViewRect(forBounds: bounds)
    textRect.origin.x += padding
    return textRect
  }
  
  // Provides right padding for image
  override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
    var textRect = super.rightViewRect(forBounds: bounds)
    textRect.origin.x -= padding
    return textRect
  }
  
  @IBInspectable var fieldImage: UIImage? = nil {
    didSet {
      updateView()
    }
  }
  
  @IBInspectable var padding: CGFloat = 0
  @IBInspectable var color: UIColor = UIColor.gray {
    didSet {
      updateView()
    }
  }
  @IBInspectable var bottomColor: UIColor = UIColor.clear {
    didSet {
      if bottomColor == UIColor.clear {
        self.borderStyle = .roundedRect
      } else {
        self.borderStyle = .bezel
      }
      self.setNeedsDisplay()
    }
  }
  
  func updateView() {

    if let image = fieldImage {
      leftViewMode = UITextFieldViewMode.always
      let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
      imageView.image = image
      // Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
      imageView.tintColor = color
      leftView = imageView
    } else {
      leftViewMode = UITextFieldViewMode.never
      leftView = nil
    }
    // Placeholder text color
    attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes:[NSForegroundColorAttributeName: color])
  }
 
  override func draw(_ rect: CGRect) {

    let path = UIBezierPath()
    path.move(to: CGPoint(x: self.bounds.origin.x, y: self.bounds.height
      - 0.5))
    path.addLine(to: CGPoint(x: self.bounds.size.width, y: self.bounds.height
      - 0.5))
    path.lineWidth = 0.5
    self.bottomColor.setStroke()
    path.stroke()
  }
}
