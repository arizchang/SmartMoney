//
//  StocksViewController.swift
//  SmartMoney
//
//  Created by Ariz Chang on 11/1/20.
//  Copyright © 2020 Ariz Chang. All rights reserved.
//

import UIKit

class StocksViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let urlAsString = "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=IBM&apikey=TWTCTGJAOKK0YG93"
        
        let url = URL(string: urlAsString)!
        let urlSession = URLSession.shared
        
        let jsonQuery = urlSession.dataTask(with: url, completionHandler: { data, response, error -> Void in
            if (error != nil) {
                print(error!.localizedDescription)
            }
            var err: NSError?
            
            
            var jsonResult = (try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)) as! NSDictionary
            if (err != nil) {
                print("JSON Error \(err!.localizedDescription)")
            }

            //print(jsonResult)
            
            let metaData = jsonResult["Meta Data"] as! NSDictionary
            let lastRefreshed = metaData["3. Last Refreshed"] as! String
            let stats = jsonResult["Time Series (Daily)"] as! NSDictionary
            let keys = stats.allKeys
            let day = stats[lastRefreshed] as! NSDictionary
            let high = day["2. high"]
            print("\(lastRefreshed): \(day)")
            
            
        })
        jsonQuery.resume()
    }
        

}
