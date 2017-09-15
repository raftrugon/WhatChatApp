//
//  LoginVC.swift
//  WhatChatApp
//
//  Created by rafa on 15/9/17.
//  Copyright © 2017 rafa trujillo. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var txtFieldUserName: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buLogin(_ sender: Any) {
        
        performSegue(withIdentifier: "chatRoom", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "chatRoom" {
            
            if let dis = segue.destination as? mainVC {
                dis.nameUser = self.txtFieldUserName.text
            }
        }
    }

}
