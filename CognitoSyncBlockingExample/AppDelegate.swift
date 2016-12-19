//
//  AppDelegate.swift
//  CognitoSyncBlockingExample
//
//  Created by Yu, William on 12/19/16.
//  Copyright © 2016 iwllyu. All rights reserved.
//

import UIKit
import AWSCore

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        let identityPoolId = "yourPoolId"
        let regionType: AWSRegionType = .USEast1
        
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: regionType, identityPoolId: identityPoolId)
        let configuration = AWSServiceConfiguration(region: regionType, credentialsProvider: credentialProvider)
        AWSServiceManager.defaultServiceManager().defaultServiceConfiguration = configuration
        
        return true
    }

}

