//
//  UIConstructor.swift
//  NYTimes
//
//  Created by Fouad Bakour on 11/21/20.
//  Copyright (c) 2020 Eurisko Mobility. All rights reserved.
//

import Foundation
import UIKit

/// This class was designed & implemented to: Help building UILabels with params
class UIConstructor: NSObject {
    
    // MARK: - UILabel Setup
    /// This method/function was designed & implemented to: Help setting up a UILabel
    ///
    /// - Parameters:
    ///   - label: Target UILabel
    ///   - labelText: Label text
    ///   - textColor: Label Color
    ///   - textFont: Label Font
    ///   - attributedText: Attributed String
    ///   - textAlignment: Label text alignment
    ///   - numberOfLines: Label lines
    static func setupLabel(label: UILabel?,
                           labelText: String?,
                           textColor: UIColor?,
                           textFont: UIFont,
                           attributedText: NSMutableAttributedString?,
                           textAlignment: NSTextAlignment,
                           numberOfLines: Int?,
                           lineBreakMode:NSLineBreakMode = .byWordWrapping) {
        if attributedText != nil {
            label?.attributedText = attributedText
        } else {
            label?.text = labelText
            label?.font = textFont
            label?.textColor = textColor
        }
        
        if numberOfLines == 1 {
           label?.lineBreakMode = .byTruncatingTail
        } else {
            label?.lineBreakMode = lineBreakMode
        }
        label?.textAlignment = textAlignment
        label?.numberOfLines = numberOfLines!
    }
    
    /// This method/function was designed & implemented to: Help setting up a UITextField
    /// - Parameters:
    ///   - textField: target text field
    ///   - textFieldText: text field text
    ///   - textColor: text color
    ///   - textFont: text font
    ///   - placeHolderAttr: place holder attributes
    ///   - textAlignment: text field text alignment
    ///   - keyboardType: keyboard type
    static func setupTextField(textField: UITextField?,
                               textFieldText: String?,
                               textColor: UIColor?,
                               textFont: UIFont?,
                               placeHolderAttr: NSMutableAttributedString?,
                               textAlignment: NSTextAlignment,
                               keyboardType: UIKeyboardType) {
        
        if let textFieldText = textFieldText {
            textField?.text = textFieldText
        }
        if let textColor = textColor {
            textField?.textColor = textColor
        }
        if let textFont = textFont {
            textField?.font = textFont
        }
        if let placeHolderAttr = placeHolderAttr {
            textField?.attributedPlaceholder = placeHolderAttr
        }
        textField?.keyboardType = keyboardType
        textField?.textAlignment = textAlignment
        textField?.keyboardAppearance = .light
    }
    
    // MARK: - UIButton setup
    /// This method/function was designed & implemented to: Help setting up a UIButton
    ///
    /// - Parameters:
    ///   - button: Target button
    ///   - title: Button title
    ///   - titleColor: Button title color
    ///   - font: Button font family
    ///   - backgroundColor: Button bg color
    ///   - backgroundImage: Button bg image
    ///   - image: Button image
    static func setupButton(button:UIButton, title:String, titleColor:UIColor, font:UIFont, backgroundColor:UIColor?, backgroundImage:UIImage?, image:UIImage?) {
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.titleLabel?.font = font
        button.backgroundColor = backgroundColor
        if let backgroundImage = backgroundImage {
            button.setBackgroundImage(backgroundImage, for: .normal)
        }
        if let image = image {
            button.setImage(image, for: .normal)
        }
    }
    
    
    // MARK: - NSMutableString Builder From ininity Strings
    /// This method/function was designed & implemented to: Build NSMutableAttributedString from different strings
    /// - Parameter strings: the target strings
    static func buildAttrStrings(_ strings: (text: String, color: UIColor, font: UIFont)...) -> NSMutableAttributedString {
        let string = NSMutableAttributedString()
        strings.forEach { (text, color, font) in
            string.append(NSAttributedString(string: text,
                                             attributes: [.font: font,
                                                          .foregroundColor: color]))
        }
        return string
    }
}
