//
//  HomeView+Collection.swift
//  NYTimes
//
//  Created by Fouad Bakour on 11/21/20.
//  Copyright (c) 2020 Eurisko Mobility. All rights reserved.
//

import UIKit

// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.tableArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCollectionCell.className, for: indexPath) as? NewsCollectionCell ?? NewsCollectionCell()
        let item = self.tableArray[indexPath.row]
        
        // Title
        cell.titleLabel?.text = item.title ?? ""
        
        // By line & Date
        let byLine = item.byline ?? ""
        let dateStr = item.publishedDate ?? ""
        let attr = UIConstructor.buildAttrStrings((text: byLine + " " + translate("on") + " ", color: .lightGray, font: UIFont.systemFont(ofSize: 15)),
                                       (text: dateStr, color: .lightGray, font: UIFont.systemFont(ofSize: 15)))
        cell.byAndDateLabel?.attributedText = attr
        
        // Image View
        var imageUrlStr:String?
        
        // Check if we have cached image
        // Usually its used when we have cached news or there is no internet connection
        if item.imageURL != nil {
            imageUrlStr = item.imageURL
        } else {
            // Fetch our target image from array of media
            for mediaItem in item.media ?? [] {
                for mediaImage in mediaItem.mediaMetadata ?? [] {
                    // Check our target media type and load
                    if mediaImage.format == MediaFormat.mediumThreeByTwo440 {
                        imageUrlStr = mediaImage.url ?? ""
                        break
                    }
                }
            }
        }
        
        // Lazy load image URL
        if let imageUrlStr = imageUrlStr {
            let imageUrl = URL.init(string: imageUrlStr)
            cell.backgroundImage?.kf.indicatorType = .activity
            cell.backgroundImage?.kf.setImage(with: imageUrl, placeholder: UIImage.init(named: "LogoWhite"), options: [.transition(.fade(1)), .cacheOriginalImage], progressBlock: { (int1, int2) in
            }, completionHandler: { (result) in
                switch result {
                case .failure(_):
                    cell.backgroundImage?.image = UIImage.init(named: "LogoWhite")
                    break
                case .success(_):
                    break
                }
            })
        } else {
            cell.backgroundImage?.image = UIImage.init(named: "LogoWhite")
        }
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension HomeViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // Get tapped cell location
        let cell = collectionView.cellForItem(at: indexPath) as! CardCollectionViewCell
        
        // Assing cell settings
        cell.settings.cardContainerInsets = UIEdgeInsets(top: 8.0, left: 16.0, bottom: 8.0, right: 16.0)
        cell.settings.isEnabledBottomClose = true
        
        // Assing transition
        transition = CardTransition(cell: cell, settings: cell.settings)
        
        // Get current cell values
        if let myCell = cell as? NewsCollectionCell {
            
            // Define our coordinator.
            let coord = DetailsCoordinator.init(navigationController: self.navigationController!,
                                                subtitle: myCell.byAndDateLabel?.attributedText,
                                                header: myCell.titleLabel?.text,
                                                background: myCell.backgroundImage.image,
                                                details: self.tableArray[indexPath.row].abstract ?? "")
            
            // Assign values to the VC
            let viewController = coord.viewController!
            viewController.settings = cell.settings
            viewController.transitioningDelegate = transition
            
            // If `modalPresentationStyle` is not `.fullScreen`, this should be set to true to make status bar depends on presented vc.
            //viewController.modalPresentationCapturesStatusBarAppearance = true
            viewController.modalPresentationStyle = .custom
            
            presentExpansion(viewController, cell: cell, animated: true)
        }
    }
}

extension HomeViewController: CardsViewController {}
