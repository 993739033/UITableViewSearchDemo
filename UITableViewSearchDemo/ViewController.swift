//
//  ViewController.swift
//  UITableViewSearchDemo
//
//  Created by apple_mini on 2019/3/6.
//  Copyright © 2019年 ShangHaiBangBo. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource ,UISearchBarDelegate,UISearchResultsUpdating {
    
    let names = ["A1","B2","C2","D5","A1","B2","C2","D5","A1","B2","C2","D5"]
    var searchNames :[String]!
    let titles = ["A","B","C","D","E"]
    
    @IBOutlet weak var searchBar: UITableView!
    @IBOutlet weak var tableView: UITableView!
    
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchContent = searchController.searchBar.text
        var ns:[String] = []
        for name in names{
            if name.contains(searchContent!){
                ns.append(name)
            }
        }
        searchNames = ns
        tableView.reloadData()
        print("reloadData")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        searchNames = names
        
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.navigationItem.title = "SearchView"
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! UITableViewCell
        cell.textLabel?.text = "Name:\(searchNames[indexPath.row])>\(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titles[section]
    }
    
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return titles
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        tableView.setEditing(editing, animated: animated)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        if indexPath.row <= 5{
            return .delete
        }
        
        return .insert//.delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete){
//            do{
//                 try  tableView.deleteRows(at: [indexPath], with: .fade)
//            }catch let e as exception{
//                print(e)
//            }
       
        }
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        if indexPath.row < 10 && indexPath.row > 5{
            return false
        }
        
        return true
    }


}

