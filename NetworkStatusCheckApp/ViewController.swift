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
    
    //online → offlineの状態変化で呼ばれる
    func changeOffline() {
        reachability.whenUnreachable = { [self] reachability in
            networkStatusImage.image = errorImage
            showAlertOffline()
            print("接続なし")
        }
        try? reachability.startNotifier()
    }
    
    //offline → onlineの状態変化で呼ばれる
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
    
    //オフライン時にのみ呼ばれるアラート
    func showAlertOffline() {
        let alert = UIAlertController(title: "エラー", message: "インターネット接続状況を確認して再度お試しください。", preferredStyle: .alert)
        let reloadAction = UIAlertAction(title: "再試行", style: .default, handler: { [self] _ in
            if reachability.connection == .unavailable {
                showAlertOffline()
                print("接続なし")
            }
        })
        alert.addAction(reloadAction)
        present(alert, animated: true, completion: nil)
    }
}
