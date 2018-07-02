//
//  CreateTaskViewController.swift
//  todoapp
//
//  Created by okuzawats on 2018/07/02.
//  Copyright © 2018年 okuzawats. All rights reserved.
//

import UIKit

protocol CreateTaskViewDelegate: class {
    func createView(taskEditting view: CreateTaskView, text: String)
    func createView(deadlineEditting view: CreateTaskView, deadline: Date)
    func createView(saveButtonDidTap view: CreateTaskView)
}

class CreateTaskView: UIView {
    
}
