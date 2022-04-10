//
//  ViewController.swift
//  MidtermApril9
//
//  Created by Ruilin 😈 on 4/9/22.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, SendStockDelegate{
   
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tblView: UITableView!
    
    @IBOutlet weak var lblCompanyName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblDayLow: UILabel!
    @IBOutlet weak var lblDayHigh: UILabel!
    @IBOutlet weak var lblSymbol: UILabel!
    let locationManager=CLLocationManager()
    var stocksModel: [StockModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stocksModel = initializeCities()
    }
    
    func initializeCities() -> [StockModel]{
            let currentStock = StockModel("Facebook", "FB");
            let Facebook = StockModel("Facebook", "FB");
            let Apple = StockModel("Apple", "AAPL");
            let Google = StockModel("Google", "GOOG");
            let Microsoft = StockModel("Microsoft", "MSFT");
            let Amazon = StockModel("Amazon", "AMZN");
        
            var modelArr = [StockModel]()
            
            modelArr.append(currentStock)
            modelArr.append(Facebook)
            modelArr.append(Apple)
            modelArr.append(Google)
            modelArr.append(Microsoft)
            modelArr.append(Amazon)

            return modelArr
        }
    
    func sendStockData(_ stockModel: StockModel) {
        lblCompanyName.text=stockModel.Name
        //Company Name, Symbol, Price, Day High and Day low
        lblSymbol.text=stockModel.Symbol
        lblPrice.text="Price: \(stockModel.Price) $"
        lblDayHigh.text="DayHigh: \(stockModel.DayHigh) $"
        lblDayLow.text="DayLow: \(stockModel.DayLow) $"
    }
    

}

