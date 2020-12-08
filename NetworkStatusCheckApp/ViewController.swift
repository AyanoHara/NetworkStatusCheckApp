//
//  ViewController.swift
//  NetworkStatusCheckApp
//
//  Created by AYANO HARA on 2020/12/08.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var networkStatusImage: UIImageView!
    
    let networkImage = #imageLiteral(resourceName: "network")
    let wifiImage = #imageLiteral(resourceName: "wi-fi")
    let errorImage = #imageLiteral(resourceName: "error")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkStatusImage.image = networkImage
    }
}
