//
//  chatRoomCell.swift
//  WhatChatApp
//
//  Created by rafa on 15/9/17.
//  Copyright © 2017 rafa trujillo. All rights reserved.
//

import UIKit

class chatRoomCell: UITableViewCell {

    @IBOutlet weak var laUserName: UILabel!
    
    @IBOutlet weak var laText: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setChat(chat:Chat){
        laUserName.text = chat.userName
        laText.text = chat.text
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
