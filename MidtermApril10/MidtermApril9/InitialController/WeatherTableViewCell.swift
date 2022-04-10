//
//  WeatherTableViewCell.swift
//  MidtermApril9
//
//  Created by Ruilin 😈 on 4/10/22.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
   
    @IBOutlet weak var lblCompanyName: UILabel!
    
    @IBOutlet weak var lblSymbol: UILabel!
    var CompanyName=""
    var Symbol=""
    
    var sendStockDelegate: SendStockDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func getWeatherAction(_ sender: Any) {
        let currentURL=getCurrentStockPriceURL(Symbol)
        getCurrentWeather(currentURL).done{ stockModel in
            stockModel.Symbol=self.Symbol
//            stockModel.Name =
            self.sendStockDelegate?.sendStockData(stockModel)
        }
        .catch { error in
            print(error.localizedDescription)
        }
    }
}
