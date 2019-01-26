//
//  ViewController.swift
//  Example
//
//  Created by Mitsuhau Emoto on 2019/01/18.
//  Copyright © 2019 Mitsuhau Emoto. All rights reserved.
//

import UIKit
import MEOException

class ViewController: UIViewController {

    var tableView: UITableView!
    var counter: Int = 0
    var alert: UIAlertController? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "e.g. reload cells out of range"
        
        self.addTableView()
    }
    
    func addTableView(){
        
        self.removeTableView()
        
        self.tableView = UITableView(frame: self.view.bounds,
                                     style: UITableView.Style.plain)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib(nibName: "VanillaCell", bundle: nil),
                                forCellReuseIdentifier: "VanillaCell")
        self.view.addSubview(self.tableView)
    }
    
    func removeTableView()  {
        guard
            let tableView = self.tableView,
            let _ = self.tableView.superview else {
                return
        }
        tableView.dataSource = nil
        tableView.delegate = nil
        tableView.removeFromSuperview()
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VanillaCell",
                                                 for: indexPath)
        cell.textLabel?.text = "row:\(indexPath.row), counter:\(counter)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let ip = IndexPath(row: 100, section: 100)
        self.counter += 1
        
        self.tableView.exc.reloadRows(at: [ip], with: .automatic) { (exception) in
            print("[reloadRows] exception:\(exception)")
            
            self.alert = {
                let alert = UIAlertController(title: "exception",
                                              message: exception.description,
                                              preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "fix TableView",
                                              style: UIAlertAction.Style.default,
                                              handler: { (action) in
                                                self.addTableView()
                }))
                return alert
            }()
            if let alert = self.alert{
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}

