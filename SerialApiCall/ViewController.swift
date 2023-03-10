//
//  ViewController.swift
//  SerialApiCall
//
//  Created by shubhan.langade on 18/02/23.
//

import UIKit

class ViewController: UIViewController {
    let syncResources = SyncResource()
    override func viewDidLoad() {
        super.viewDidLoad()
        syncResources.syncResource()
        // Do any additional setup after loading the view.
    }
}

