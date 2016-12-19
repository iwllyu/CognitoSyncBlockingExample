//
//  ViewController.swift
//  CognitoSyncBlockingExample
//
//  Created by Yu, William on 12/19/16.
//  Copyright © 2016 iwllyu. All rights reserved.
//

import UIKit
import AWSCognito

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    var dataset: AWSCognitoDataset!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        let datasetName = "datasetName"
        let datasetKey = "datasetKey"
        
        let client = AWSCognito.defaultCognito()
        dataset = client.openOrCreateDataset(datasetName)
        dataset.setString("test string", forKey: datasetKey)
    }

    @IBAction func clickTwiceToBlockAction(sender: AnyObject) {
        
        dataset.synchronize().continueWithBlock { (task: AWSTask!) -> AnyObject in
            
            if task.cancelled {
                //how to cancel?
            } else if let taskError = task.error {
                NSLog("Error: %@", taskError)
            } else {
                NSLog("Success")
            }
        
            return task
        }
    }
}

