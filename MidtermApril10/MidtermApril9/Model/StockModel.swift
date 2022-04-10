//
//  StockModel.swift
//  MidtermApril9
//
//  Created by Ruilin 😈 on 4/10/22.
//

import Foundation

class StockModel{
    init(_ CompanyName : String, _ Symbol : String){
            self.Name = CompanyName
            self.Symbol = Symbol
        }
    var Name = ""
    var Symbol = ""
    var Price :Float=0.0;
    var DayHigh : Float=0.0;
    var DayLow :Float=0.0;
 
}
