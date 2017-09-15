//
//  ViewController.swift
//  WhatChatApp
//
//  Created by rafa on 15/9/17.
//  Copyright © 2017 rafa trujillo. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class mainVC: UIViewController {

    var ref = DatabaseReference.init()
    var nameUser:String?
    
    //IBOutlets
    @IBOutlet var textFieldName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loginAnony()
      
        self.ref = Database.database().reference()
    }

 

    
    func loginAnony(){
        Auth.auth().signInAnonymously { (user, error) in
            if error != nil {
                print("Cannot Login")
            }else{
                if user != nil{
                print("userUID \(user!.uid)")
                }
            }
        }
    }

    //IBActions
    @IBAction func sendBtnPressed(_ sender: Any) {
        let dic = [ "text" : textFieldName.text ?? "unknow",
                    "name" : nameUser!,
                    "postDate" : ServerValue.timestamp()] as [String:Any]
        self.ref.child("chat").childByAutoId().setValue(dic)    }
    

}

