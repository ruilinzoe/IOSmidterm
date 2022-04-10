//
//  NetworkFunctions.swift
//  MidtermApril9
//
//  Created by Ruilin 😈 on 4/10/22.
//

import Foundation
import PromiseKit
import Alamofire
import SwiftyJSON


func getCurrentStockPriceURL(_ Symbol : String) -> String{
    let url = "\(currentStockPriceURL)\(Symbol)?apikey=\(apiKey)"
    return url
}



func getCurrentWeather(_ url : String) -> Promise<StockModel>{
    
    return Promise<StockModel> { seal -> Void in
        
        //make request to url get JSON back
        AF.request(url).responseJSON { response in
            
//            print(url)
            //no error
            if response.error != nil {
                seal.reject(response.error!)
            }
            
            let stockModel = StockModel("","")
            //get data here
            let currentStockArray = JSON(response.data!).arrayValue
            guard let currentStock=currentStockArray.first else{
                return seal.fulfill(stockModel)
            }
            

            stockModel.Name = currentStock["name"].stringValue
            stockModel.Symbol = currentStock["symbol"].stringValue
            stockModel.Price = currentStock["price"].floatValue
            stockModel.DayHigh = currentStock["dayHigh"].floatValue
            stockModel.DayLow = currentStock["dayLow"].floatValue
            
//            self.lbl.text="Open Price:\(quote.open)$"
            seal.fulfill(stockModel)

        }// end of response
    }// end is return Promise
}// end of function

