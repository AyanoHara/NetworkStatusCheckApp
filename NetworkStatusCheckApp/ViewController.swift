//
//  ViewController.swift
//  NetworkStatusCheckApp
//
//  Created by AYANO HARA on 2020/12/08.
//

import UIKit
import Reachability

class ViewController: UIViewController {
    
    @IBOutlet weak var networkStatusImage: UIImageView!
    
    let networkImage = #imageLiteral(resourceName: "network")
    let wifiImage = #imageLiteral(resourceName: "wi-fi")
    let errorImage = #imageLiteral(resourceName: "error")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let reachability = try! Reachability()
        switch reachability.connection {
        case .cellular:
            networkStatusImage.image = networkImage
            print("キャリアの回線に接続しています")
        case .wifi:
            networkStatusImage.image = wifiImage
            print("Wi-Fi に接続しています")
        case .unavailable:
            networkStatusImage.image = errorImage
            print("インターネットに接続されていません")
        case .none:
            break
        }
    }
}
