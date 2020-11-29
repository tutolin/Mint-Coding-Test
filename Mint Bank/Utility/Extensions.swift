//
//  Extensions.swift
//  Mint Bank
//
//  Created by Aboyeji Tolulope on 29/11/2020.
//

import Foundation

extension String {
    
    
    func convertDateTimeString(fromDateFormattor: String, toDateFormattor: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        let tempLocale = dateFormatter.locale
        dateFormatter.locale = Locale(identifier: "en_NG")
        dateFormatter.dateFormat = fromDateFormattor
        let date = dateFormatter.date(from: self)
        dateFormatter.dateFormat = toDateFormattor
        dateFormatter.locale = tempLocale
        dateFormatter.timeZone = TimeZone.current
        return dateFormatter.string(from: date ?? Date())
    }
    
   
    
}
