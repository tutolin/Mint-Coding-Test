//
//  CommitCell.swift
//  Mint Bank
//
//  Created by Aboyeji Tolulope on 29/11/2020.
//

import UIKit

class CommitCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var commitMessageLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!

    
    static let cellID = "CommitCell"
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(commit: CommitModel){
        nameLbl.text = "\(commit.commit?.author?.name ?? "")(\(commit.commit?.author?.email ?? ""))"
        
        commitMessageLbl.text = commit.commit?.message
        
        dateLbl.text = commit.commit?.author?.date?.convertDateTimeString(fromDateFormattor:  "yyyy-MM-dd HH:mm:ss", toDateFormattor: "h:mm a, MMM d")
        
    }
}
