//
//  TableViewCode.swift
//  MidtermApril9
//
//  Created by Ruilin 😈 on 4/9/22.
//

import Foundation
import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let rows=stocksModel?.count else{return 0}
        return rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("WeatherTableViewCell", owner: self, options: nil)?.first as! WeatherTableViewCell
                
                guard let cityModel = stocksModel?[indexPath.row] else {return cell}

                if indexPath.row == 0 {
                    cell.lblCompanyName.text = "Current Location"
                }else {
                    cell.lblCompanyName.text = cityModel.Name
                    cell.lblSymbol.text = cityModel.Symbol
                }
                cell.Symbol = cityModel.Symbol
                cell.CompanyName = cityModel.Name
        cell.sendStockDelegate=self
                
                return cell
    }
}
