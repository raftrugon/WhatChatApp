//
//  ViewController.swift
//  WhatChatApp
//
//  Created by rafa on 15/9/17.
//  Copyright © 2017 rafa trujillo. All rights reserved.
//

import UIKit
import Firebase

class mainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loginAnony()
    }

 
    func loginAnony(){
        Auth.auth().signInAnonymously { (user, error) in
            
            if let error !=nil {
                print("Cannot Login")
            } else {
                print("userUID \(user?.uid)")
            }
        }
    }


}

