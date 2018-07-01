//
//  TaskDataSource.swift
//  todoapp
//
//  Created by okuzawats on 2018/07/01.
//  Copyright © 2018年 okuzawats. All rights reserved.
//

import Foundation

class TaskDataSource: NSObject {
    private var tasks = [Task]()
    
    // UserDefaultsから保存したタスクを取得する
    func loadData() {
        let userDefaults = UserDefaults.standard
        let taskDictionaries = userDefaults.object(forKey: "task") as? [[String: Any]]
        
        guard let t = taskDictionaries else {
            return
        }
        
        for dic in t {
            let task = Task(from: dic)
            tasks.append(task)
        }
    }
    
    // TaskをUserDefaultsに保存する
    func save(task: Task) {
        tasks.append(task)
        
        var taskDictionaries = [[String: Any]]()
        for t in tasks {
            let taskDictionary: [String: Any] = ["text": t.text, "deadline": t.deadline]
            taskDictionaries.append(taskDictionary)
        }
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(taskDictionaries, forKey: "tasks")
        userDefaults.synchronize()
    }
    
    // Taskの総数を返す
    func count() -> Int {
        return tasks.count
    }
    
    // 指定したindexに対するTaskを返す。
    func data(at index: Int) -> Task? {
        if tasks.count > index {
            return tasks[index]
        }
        return nil
    }
}
