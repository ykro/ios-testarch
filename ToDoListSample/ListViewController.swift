//
//  ListViewController.swift
//  ToDoListSample
//
//  Created by ykro on 8/14/16.
//  Copyright © 2016 Bit & Ik'. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView?
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView?
    
    @IBAction func didClickedSync(sender: AnyObject) {
        presenter?.getUsers()
    }
    
    @IBAction func didClickedAsync(sender: AnyObject) {
        presenter?.getUsersAsync()
    }
    
    var presenter: ListPresenter?
    private var people = [Person]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView?.dataSource = self
        tableView?.delegate = self
        activityIndicator?.hidesWhenStopped = true
        presenter?.getUsers()        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
        let person = people[indexPath.row]
        cell.textLabel?.text = person.name
        cell.detailTextLabel?.text = person.email
        cell.textLabel
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        presenter?.itemClicked(people[indexPath.row])
    }
}

extension ListViewController: ListView {
    func setData(people: [Person]) {
        self.people = people
        tableView?.reloadData()
    }
    
    func showList(){
        tableView?.hidden = false
    }
    
    func hideList(){
        tableView?.hidden = true
    }
    
    func showProgress(){
        activityIndicator?.hidden = false
        activityIndicator?.startAnimating()
    }
    
    func hideProgress(){
        activityIndicator?.stopAnimating()
        activityIndicator?.hidden = true        
    }
}