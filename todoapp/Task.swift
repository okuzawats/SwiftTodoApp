//
//  Task.swift
//  todoapp
//
//  Created by okuzawats on 2018/07/01.
//  Copyright © 2018年 okuzawats. All rights reserved.
//

import Foundation

class Task {
    let text: String // タスクの内容
    let deadline: Date // タスクの締め切り時間
    
    init(text: String, deadline: Date) {
        self.text = text
        self.deadline = deadline
    }
    
    init(from dictionary: [String: Any]) {
        self.text = dictionary["text"] as! String
        self.deadline = dictionary["deadline"] as! Date
    }
}
