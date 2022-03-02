//
//  UIView.swift
//  KabumChallenge
//
//  Created by Luis Eduardo Silva Oliveira on 15/10/21.
//

import UIKit

extension UIView {
    
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                left: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = 0,
                paddingLeft: CGFloat = 0,
                paddingBottom: CGFloat = 0,
                paddingRight: CGFloat = 0,
                widht: CGFloat? = nil,
                height: CGFloat? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        if let widht = widht {
            widthAnchor.constraint(equalToConstant: widht).isActive = true
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func setDimension(widht: CGFloat, height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: widht).isActive = true
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    func center(inView view: UIView, yConstant: CGFloat? = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: yConstant!).isActive = true
    }
    
    func centerX(inView view: UIView, topAnchor: NSLayoutYAxisAnchor? = nil, paddingTop: CGFloat? = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        if let topAnchor = topAnchor {
            self.topAnchor.constraint(equalTo: topAnchor, constant: paddingTop!).isActive = true
        }
    }
    
    func centerY(inView view: UIView, leftAnchor: NSLayoutXAxisAnchor? = nil, paddingLeft: CGFloat? = nil, constant: CGFloat? = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant!).isActive = true
        
        if let leftAnchor = leftAnchor, let padding = paddingLeft {
            self.leftAnchor.constraint(equalTo: leftAnchor, constant: padding).isActive = true
        }
    }
}

extension UIView {
  
  func preencher(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = UIEdgeInsets.zero, size: CGSize = CGSize.zero) {
    translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
    
        if let leading = leading {
          leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let bottom = bottom {
          bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if let trailing = trailing {
          trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
    
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
    
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
  }
  
  func preencherSuperview(padding: UIEdgeInsets = .zero) {
      translatesAutoresizingMaskIntoConstraints = false
        if let superviewTopAnchor = superview?.topAnchor {
          topAnchor.constraint(equalTo: superviewTopAnchor, constant: padding.top).isActive = true
        }
      
        if let superviewBottomAnchor = superview?.bottomAnchor {
          bottomAnchor.constraint(equalTo: superviewBottomAnchor, constant: -padding.bottom).isActive = true
        }
      
        if let superviewLeadingAnchor = superview?.leadingAnchor {
          leadingAnchor.constraint(equalTo: superviewLeadingAnchor, constant: padding.left).isActive = true
        }
      
        if let superviewTrailingAnchor = superview?.trailingAnchor {
          trailingAnchor.constraint(equalTo: superviewTrailingAnchor, constant: -padding.right).isActive = true
        }
  }
  
  func centralizasSuperview(size: CGSize = .zero) {
      translatesAutoresizingMaskIntoConstraints = false
      
      if let superviewCenterXAnchor = superview?.centerXAnchor {
          centerXAnchor.constraint(equalTo: superviewCenterXAnchor).isActive = true
      }
      
      if let superviewCenterYAnchor = superview?.centerYAnchor {
          centerYAnchor.constraint(equalTo: superviewCenterYAnchor).isActive = true
      }
      
      if size.width != 0 {
          widthAnchor.constraint(equalToConstant: size.width).isActive = true
      }
      
      if size.height != 0 {
          heightAnchor.constraint(equalToConstant: size.height).isActive = true
      }
  }
  
  func size(size: CGSize = .zero) {
      translatesAutoresizingMaskIntoConstraints = false
      
      if size.width != 0 {
          widthAnchor.constraint(equalToConstant: size.width).isActive = true
      }
      
      if size.height != 0 {
          heightAnchor.constraint(equalToConstant: size.height).isActive = true
      }
  }
}
