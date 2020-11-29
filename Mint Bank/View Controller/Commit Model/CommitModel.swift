//
//  CommitModel.swift
//  Mint Bank
//
//  Created by Fundall on 29/11/2020.
//

import Foundation


// MARK: - CommitModel
struct CommitModel: Codable {
    
    let commit: CommitData?
    
}


// MARK: - CommitData
struct CommitData: Codable {
    
    let author: CommitAuthor?
    let message: String?
    
    }


// MARK: - CommitAuthor
struct CommitAuthor: Codable {
    let name, email, date: String?
}

