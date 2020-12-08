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
    
    let reachability = try! Reachability()
    let networkImage = #imageLiteral(resourceName: "network")
    let wifiImage = #imageLiteral(resourceName: "wi-fi")
    let errorImage = #imageLiteral(resourceName: "error")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeOffline()
        changeOnline()
    }
    
    func changeOffline() {
        reachability.whenUnreachable = { [self] reachability in
            networkStatusImage.image = errorImage
            print("接続なし")
        }
        try? reachability.startNotifier()
    }
    
    func changeOnline() {
        reachability.whenReachable = { [self] reachability in
            if reachability.connection == .cellular {
                networkStatusImage.image = networkImage
                print("キャリア回線接続あり")
            } else {
                networkStatusImage.image = wifiImage
                print("Wi-Fi接続あり")
            }
        }
        try? reachability.startNotifier()
    }
}
