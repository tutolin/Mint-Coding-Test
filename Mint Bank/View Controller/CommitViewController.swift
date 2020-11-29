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

       
        commitTableView.register(UINib(nibName: "\(CommitCell.cellID)" , bundle: nil), forCellReuseIdentifier: "\(CommitCell.cellID)" )

       
    }
    
    func getCommit(){
        
        activityIndicator.startAnimating()
        NetworkEngine.request(endpoint: CommitEndpoint.getCommit) { [weak self] (result: Result<[CommitModel], Error>) in
            
            switch result {
            case .success(let response):
             
                print("Response: ", response)
                
            case .failure(let error):
                DispatchQueue.main.async {
                    print("Response: ", error)
                  
                }
            }
            
        }
    }


}

extension CommitViewController:  UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if commits.count > 25 {
            
            return 25
        }
        return commits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let commitsCell = tableView.dequeueReusableCell(withIdentifier:  "\(CommitCell.cellID)", for: indexPath) as! CommitCell
        
     
            
            return commitsCell
    }
    
    
}



