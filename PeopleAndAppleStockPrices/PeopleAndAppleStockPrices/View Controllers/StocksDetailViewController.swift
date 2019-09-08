//
//  StocksDetailViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Radharani Ribas-Valongo on 9/8/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class StocksDetailViewController: UIViewController {

    //MARK: -- Properties
    @IBOutlet weak var stockImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var openingPriceLabel: UILabel!
    @IBOutlet weak var closingPriceLabel: UILabel!
    var stocks: stockInfo!
    
    
    func setUpView(){
        let urlStr = "https://si.wsj.net/public/resources/images/IF-AC796_JUNKST_GR_20161103121700.jpg"
        guard let url = URL(string: urlStr) else { return }
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                let data = try Data(contentsOf: url)
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    self.stockImage.image = image
                }
            } catch {
                print("could not load image")
            }
        }
        dateLabel.text = stocks.date
        openingPriceLabel.text = stocks.open.description
        closingPriceLabel.text = stocks.close.description
        
            
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    

}
