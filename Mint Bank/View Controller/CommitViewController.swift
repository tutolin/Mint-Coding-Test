//
//  ViewController.swift
//  Mint Bank
//
//  Created by Aboyeji Tolulope on 29/11/2020.
//

import UIKit

class CommitViewController: UIViewController {
    
    @IBOutlet private weak var commitTableView: UITableView!
    @IBOutlet private weak var errorView: UIView!
    @IBOutlet private weak var errorLabel: UILabel!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    var commits: [CommitModel] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        
        commitTableView.delegate = self
        commitTableView.dataSource = self
        commitTableView.tableFooterView = UIView()

       
        commitTableView.register(UINib(nibName: "\(RepoCell.repoID)" , bundle: nil), forCellReuseIdentifier: "\(RepoCell.repoID)" )

       
    }


}

extension RepoViewController:  UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if commits.count > 25 {
            
            return 25
        }
        return commits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let commitsCell = tableView.dequeueReusableCell(withIdentifier:  "\(RepoCell.repoID)", for: indexPath) as! RepoCell
        
     
            
            return commitsCell
    }
    
    
}



