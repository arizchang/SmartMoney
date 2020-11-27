//
//  StocksViewController.swift
//  SmartMoney
//
//  Created by Ariz Chang on 11/1/20.
//  Copyright © 2020 Ariz Chang. All rights reserved.
//

import UIKit

class StocksViewController: UIViewController {

    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var openLabel: UILabel!
    @IBOutlet weak var highLabel: UILabel!
    @IBOutlet weak var lowLabel: UILabel!
    @IBOutlet weak var closeLabel: UILabel!
    @IBOutlet weak var volLabel: UILabel!
    @IBOutlet weak var stockField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
    @IBAction func search(_ sender: UIButton) {
        let stock = stockField.text
        print(stock)
        let urlAsString = "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=\(stock!)&apikey=TWTCTGJAOKK0YG93"
        
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

            print(jsonResult["Meta Data"])
            if jsonResult["Meta Data"] != nil {
                let metaData = jsonResult["Meta Data"] as! NSDictionary
                let lastRefreshed = metaData["3. Last Refreshed"] as! String
                let stats = jsonResult["Time Series (Daily)"] as! NSDictionary
                let keys = stats.allKeys
                let day = stats[lastRefreshed] as! NSDictionary
                let open = day["1. open"]
                let high = day["2. high"]
                let low = day["3. low"]
                let close = day["4. close"]
                let volume = day["5. volume"]
                print("\(lastRefreshed): \(day)")
                
                DispatchQueue.main.async {
                    self.date.text = "\(lastRefreshed): "
                    self.date.textColor = UIColor.green
                    self.openLabel.text = "Open: $\(open!)"
                    self.highLabel.text = "High: $\(high!)"
                    self.lowLabel.text = "Low: $\(low!)"
                    self.closeLabel.text = "Close: $\(close!)"
                    self.volLabel.text = "Volume: \(volume!)"
                }
            }
            else {
                DispatchQueue.main.async {
                    self.date.text = "Invalid Stock Symbol"
                    self.date.textColor = UIColor.red
                    self.openLabel.text = ""
                    self.highLabel.text = ""
                    self.lowLabel.text = ""
                    self.closeLabel.text = ""
                    self.volLabel.text = ""
                }
            }
        })
        jsonQuery.resume()
    }
}
