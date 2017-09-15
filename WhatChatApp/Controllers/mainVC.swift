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
    

    
    func loadChatRoom(){
        
        self.ref.child("chat").queryOrdered(byChild: "postDate").observe( .value, with:
            { ( snapshot ) in
                //
                self.chatInfo.removeAll()
                
                if let snapshot =  snapshot.children.allObjects as? [DataSnapshot]{
                    
                    for snap in snapshot {
                        
                        if let postData = snap.value as? [String:AnyObject]{
                            
                            let username = postData["name"] as? String
                            let text = postData["text"] as? String
                            
                            var postDate:CLong?
                            if let postdateIn = postData["postDate"] as? CLong {
                                postDate = postdateIn
                            }
                            
                            self.chatInfo.append(Chat(userName: username!, text: text!, datePost: "\(postDate!)"))
                        }
                        
                    }
                    self.tableView.reloadData()
                    
                    let indexpath = IndexPath(row: self.chatInfo.count-1, section: 0)
                    self.tableView.scrollToRow(at: indexpath, at: .bottom, animated: true)
                }
                
        })
    }
    
    
    func loginAnony(){
        Auth.auth().signInAnonymously { (user, error) in
            if error != nil {
                print("Cannot Login")
            }else{
                if user != nil{
                print("userUID \(user!.uid)")
                self.loadChatRoom()
                }
            }
        }
    }

    //IBActions
    @IBAction func sendBtnPressed(_ sender: Any) {
        let dic = [ "text" : self.textFieldName.text ?? "unknow",
                    "name" : self.nameUser!,
                    "postDate" : ServerValue.timestamp()] as [String:Any]
        
        self.ref.child("chat").childByAutoId().setValue(dic)
        
    }
    

}

