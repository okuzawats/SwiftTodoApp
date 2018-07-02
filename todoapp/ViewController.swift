//
//  ViewController.swift
//  todoapp
//
//  Created by okuzawats on 2018/07/01.
//  Copyright © 2018年 okuzawats. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var dataSource: TaskDataSource!
    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = TaskDataSource()
        
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TaskListCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableView)
        
        let barButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(barButtonTapped(_:)))
        navigationItem.rightBarButtonItem = barButton
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dataSource.loadData()
        tableView.reloadData()
    }
    
    @objc func barButtonTapped(_ sender: UIBarButtonItem) {
        // タスク作成画面へ画面遷移
        //let controller = CreateTaskViewController()
        //present(controller, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 68
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TaskListCell
        let task = dataSource.data(at: indexPath.row)
        
        cell.task = task
        return cell
    }
}
