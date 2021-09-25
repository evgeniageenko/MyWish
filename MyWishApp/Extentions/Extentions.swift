//
//  Extentions.swift
//  MyWishApp
//
//  Created by Евгений Агеенко on 24.09.21.
//

import UIKit

class Extentions: UIViewController {

    var progressView = UIProgressView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    
    func createProgressBar(_ progressView: UIProgressView) {
        progressView.progressViewStyle = .default
        progressView.setProgress(0.0, animated: false)
        progressView.progressTintColor = UIColor.orange
        progressView.trackTintColor = UIColor.gray
        
    }

}
