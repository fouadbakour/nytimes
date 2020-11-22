//
//  Utils.swift
//  NYTimes
//
//  Created by Fouad Bakour on 11/21/20.
//  Copyright (c) 2020 Eurisko Mobility. All rights reserved.
//

import UIKit

class Utils: NSObject {
    
    
    // MARK:-  Delay
    /// This method/function was designed & implemented to: Performa a delay clousre if needed
    ///
    /// - Parameters:
    ///   - delay: How long you want to delay
    ///   - closure: The closure
    static func delay(delay: Double, closure: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            closure()
        }
    }

    // MARK Parse Codable
    /// This method/function was designed & implemented to: Parse a data response and convert it to a Codable struct
    ///
    /// - Parameters:
    ///   - data: Response data as NSData
    ///   - type: Codable struct
    ///   - successHandler: Parsing success closure
    ///   - errorHandler: Parsing error closure
    static func parseCodable <T : Codable> (data:Data?, type: T.Type, successHandler:@escaping (_ details: T) -> Void, errorHandler:@escaping (_ error:String) -> Void)  {
        do {
            let _ = try JSONDecoder().decode(T.self, from: data ?? Data())
        } catch let jsonErr {
            errorHandler("Parsing error, please contact support\nDetails:\n(\(jsonErr))")
            return
        }
        guard let responseData = data, let decodedJson = try? JSONDecoder().decode(T.self, from: responseData) else {
            errorHandler(translate("parsing_error"))
            return
        }
        successHandler(decodedJson)
    }
    
    // MARK: - Show Alert
    /// This method/function was designed & implemented to: Show a native UIAlertController
    ///
    /// - Parameters:
    ///   - title: Alert title
    ///   - message: Alert message
    ///   - style: Alert style
    static func showAlert(title: String = "", message: String = "", style: UIAlertController.Style) {
        let topView = UIApplication.topViewController() ?? UIViewController()
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Ok", comment: ""), style: .default, handler: { action in
        }))
        topView.present(alert, animated: true, completion: nil)
    }
    
    
    // MARK: - Show Alert
    /// This method/function was designed & implemented to: Show a native UIAlertController
    ///
    /// - Parameters:
    ///   - title: Alert title
    ///   - message: Alert message
    ///   - style: Alert style
    static func showAlert(title: String, message: String, cancelButton:String, style: UIAlertController.Style) {
        let topView = UIApplication.topViewController() ?? UIViewController()
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        alert.addAction(UIAlertAction(title: cancelButton, style: .default, handler: { action in
        }))
        topView.present(alert, animated: true, completion: nil)
    }
        
    /// This func will show the native share action sheet
    /// - Parameters:
    ///   - sender: the sender view e.g: UIButton
    ///   - text: the share text
    ///   - link: the share link
    ///   - delegate: the VC
    static func shareAction(sender: AnyObject? = nil, withText text: String,withLink link: String , withDelegate delegate: UIViewController) {
        
        let objectsToShare = [text ,link] as [Any]
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        if let senderView = sender {
            activityVC.popoverPresentationController?.sourceView = senderView as? UIView
        }
        activityVC.excludedActivityTypes = [UIActivity.ActivityType.copyToPasteboard,UIActivity.ActivityType.addToReadingList,UIActivity.ActivityType.assignToContact,UIActivity.ActivityType.print]
        
        delegate.present(activityVC, animated: true, completion: nil)
    }
    

    /// This func will tell if ur app is running on iPad or not
    /// - Returns: boolean
    static func isIPAD() -> Bool {
        if (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad) {
               // Ipad
            return true
        } else {
              // Iphone
            return false
        }
    }

}
