//
//  Chat.swift
//  WhatChatApp
//
//  Created by rafa on 15/9/17.
//  Copyright © 2017 rafa trujillo. All rights reserved.


import UIKit

class Chat {
    var userName:String?
    var text:String?
    var datePost:String?
    init(userName:String,text:String,datePost:String) {
        self.userName =  userName
        self.text =  text
        self.datePost = datePost
    }
}
