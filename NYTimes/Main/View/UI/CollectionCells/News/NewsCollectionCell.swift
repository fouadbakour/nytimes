//
//  NewsCollectionCell.swift
//  NYTimes
//
//  Created by Eurisko on 2/11/19.
//  Copyright © 2020 Eurisko Mobility. All rights reserved.
//

import UIKit

/// This class was designed & implemented to: Handle the news articles items
class NewsCollectionCell: UICollectionViewCell {
    
    /// This variable is used to: hold this classs reference & use it in collection views
    static let className = "NewsCollectionCell"
    
    /// This variable is used to:  hold the main container view
    @IBOutlet weak var containerView: UIView!
    
    /// This variable is used to: hold the 2 labels container, title and date
    @IBOutlet weak var labelsContainer: UIView!
    
    /// This variable is used to: hold the article image
    @IBOutlet weak var backgroundImage: UIImageView!
    
    /// This variable is used to: hold the article title label
    @IBOutlet weak var titleLabel:UILabel? {
        didSet {
            UIConstructor.setupLabel(label: titleLabel,
                                     labelText: "",
                                     textColor: .white,
                                     textFont: UIFont.systemFont(ofSize: 18, weight: .black),
                                     attributedText: nil,
                                     textAlignment: .left,
                                     numberOfLines: 0)
        }
    }
    
    /// This variable is used to: hold the written by and publish date
    @IBOutlet weak var byAndDateLabel:UILabel? {
        didSet {
            byAndDateLabel?.numberOfLines = 0
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.layer.cornerRadius = 8
        containerView.clipsToBounds = true
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.1
        layer.shadowOffset = .init(width: 0, height: 0)
        layer.shadowRadius = 8
    }

    // Make it appears very responsive to touch
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        animate(isHighlighted: true)
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        animate(isHighlighted: false)
    }
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        animate(isHighlighted: false)
    }
}

extension NewsCollectionCell: CardCollectionViewCell {
    var cardContentView: UIView {
        get {
            return containerView
        }
    }
}
