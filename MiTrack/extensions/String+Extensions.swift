//
//  String+Extensions.swift
//  MiTrack
//
//  Created by Jasper Siebelink on 2017/07/08.
//  Copyright © 2017 Jasper Siebelink. All rights reserved.
//

import UIKit

extension String {
    func display(completion: ((Void) -> Void)? = nil) {
        displayWithTitle(title: "Info", completion: completion)
    }
    
    func displayWithTitle(title: String, action: UIAlertAction? = nil, completion: ((Void) -> Void)? = nil) {
        let alertController = UIAlertController(title: title,
                                                message: self,
                                                preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "Sluiten",
                                                style: .cancel,
                                                handler: { _ in
                                                    completion?()
        }))
        
        if action != nil {
            alertController.addAction(action!)
        }
        
        if let app = UIApplication.shared.delegate, let window = app.window {
            window?.rootViewController!.present(alertController, animated: true, completion: nil)
        }
    }
}
