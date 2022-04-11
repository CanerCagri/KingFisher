//
//  ViewController.swift
//  KingFisher
//
//  Created by Caner Çağrı on 11.04.2022.
//

import UIKit
import Kingfisher


class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var linkTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func bringTapped(_ sender: Any) {
        let url = URL(string: linkTextField.text!)
        let processor = DownsamplingImageProcessor(size: imageView.bounds.size)
     
        
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(with: url, placeholder: nil , options: [.processor(processor), .scaleFactor(UIScreen.main.scale), .transition(.fade(2)), .cacheOriginalImage])
        {
            result in
            switch result {
            case .success(let value):
                print("Task Done \(value)")
            case .failure(let error):
                print("Failed \(error)")
            }
        }
    }
    
}

