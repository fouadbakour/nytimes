//
//  DetailsViewController.swift
//  NYTimes
//
//  Created by Fouad Bakour on 11/21/20.
//  Copyright (c) 2020 Eurisko Mobility. All rights reserved.
//

import UIKit

/// This class was designed & implemented to: show an article details
final class DetailsViewController: BaseViewController {
    
    // MARK: - Outlets
    
    /// This variable is used to: hold the main scroll view
    @IBOutlet weak var contentScrollView: UIScrollView! {
        didSet {
            self.contentScrollView.delegate = self
            self.contentScrollView.backgroundColor = #colorLiteral(red: 0.1403048337, green: 0.1452676058, blue: 0.1451510191, alpha: 1)
        }
    }
    
    /// This variable is used to: hold the header view, usually it contains image and 2 labels
    @IBOutlet weak var headerView: UIView!
    
    /// This variable is used to: the subtitle label
    @IBOutlet weak var subtitleLabel: UILabel!
    
    /// This variable is used to: show the artilce image
    @IBOutlet weak var backgroundImage: UIImageView!
    
    /// This variable is used to: handle the height of the header view, used for animation
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    /// This variable is used to: show the article header label
    @IBOutlet weak var headerLabel:UILabel! {
        didSet {
            UIConstructor.setupLabel(label: headerLabel,
                                     labelText: "",
                                     textColor: .white,
                                     textFont: UIFont.systemFont(ofSize: 18, weight: .black),
                                     attributedText: nil,
                                     textAlignment: .left,
                                     numberOfLines: 0)
        }
    }
    
    /// This variable is used to: show the article details
    @IBOutlet weak var detailsLabel:UILabel! {
        didSet {
            UIConstructor.setupLabel(label: detailsLabel,
                                     labelText: "",
                                     textColor: .white,
                                     textFont: UIFont.systemFont(ofSize: 18, weight: .bold),
                                     attributedText: nil,
                                     textAlignment: .left,
                                     numberOfLines: 0)
        }
    }
    
    // MARK: - Vars / Values
    
    /// This variable is used to: hold a passed value from the coordinator
    var subtitle: NSAttributedString? = nil
    
    /// This variable is used to: hold a passed value from the coordinator
    var header: String? = nil
    
    /// This variable is used to: hold a passed value from the coordinator
    var background: UIImage? = nil
    
    /// This variable is used to: hold a passed value from the coordinator
    var details: String?

    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - View Appear / View Disappear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    // MARK: - Setup View
    func setupView() {
        self.view.clipsToBounds = true
        self.scrollView.contentInsetAdjustmentBehavior = .never
        
        // Assign our incoming values from coordinator
        let _ = dismissHandler
        if let header = self.header {
            self.headerLabel.text = header
        }
        if let subtitle = self.subtitle {
            self.subtitleLabel.attributedText = subtitle
        }
        if let background = self.background {
            self.backgroundImage.image = background
        }
        if let details = self.details {
            self.detailsLabel.text = details
        }
        heightConstraint.constant = UIScreen.main.bounds.width * 1.272 - 16.0
    }
}

// MARK: - UIScrollViewDelegate
extension DetailsViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // prevent bouncing when swiping down to close
        // scrollView.bounces = scrollView.contentOffset.y > 100
        
        dismissHandler.scrollViewDidScroll(scrollView)
    }
}

// MARK: - CardDetailViewController
extension DetailsViewController: CardDetailViewController {
    var scrollView: UIScrollView {
        return contentScrollView
    }
    var cardContentView: UIView {
        return headerView
    }
}
