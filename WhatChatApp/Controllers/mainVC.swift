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

class mainVC: UIViewController,UITableViewDelegate, UITableViewDataSource {

    var ref = DatabaseReference.init()
    var nameUser:String?
    var chatInfo = [Chat]()
    
    //IBOutlets
    @IBOutlet var textFieldName: UITextField!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loginAnony()
      
        self.ref = Database.database().reference()
        tableView.delegate = self
        tableView.dataSource = self
    }

 
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatInfo.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellChat:ChatRoomCell = tableView.dequeueReusableCell(withIdentifier: "chatRoomCell", for: indexPath) as! ChatRoomCell
        cellChat.setChat(chat: chatInfo[indexPath.row])
        return cellChat
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

