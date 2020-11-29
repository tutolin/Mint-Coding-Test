//
//  CommitCell.swift
//  Mint Bank
//
//  Created by Fundall on 29/11/2020.
//

import UIKit

class CommitCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var commitMessageLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!

    
    static let cellID = "RepoCell"
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
