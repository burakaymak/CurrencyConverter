//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Burak Kaymak on 27.08.2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cadLabel: UILabel!
    @IBOutlet weak var chfLabel: UILabel!
    @IBOutlet weak var gbpLabel: UILabel!
    @IBOutlet weak var jpyLabel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var tryLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    @IBAction func getRatesClicked(_ sender: Any) {
        
        // 1) Request & Session -> Data URL'ine gitmek,istek yollamak.
        // 2) Response & Data -> İsteği almak
        // 3)Parsing & JSON Serialization -> İsteği işlemek.
        
        // 1)
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=52671d1afe35f604302011ed3d758ef2")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!) { data, response, error in
            
            if error != nil {
                
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true)
                
                
            }
            
            else {
                
                // 2)
                if data != nil {
                    
                    do{
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                        
                        DispatchQueue.main.async {
                            
                            // 3)
                            if let rates = jsonResponse["rates"] as? [String : Any ] {
                                
                                if let cad = rates["CAD"] as? Double {
                                    self.cadLabel.text = "CAD : \(cad)"
                                }
                                
                                if let chf = rates["CHF"] as? Double {
                                    self.chfLabel.text = "CHF : \(chf)"
                                }
                                
                                if let gbp = rates["GBP"] as? Double {
                                    self.gbpLabel.text = "GBP : \(gbp)"
                                }
                                
                                if let jpy = rates["JPY"] as? Double {
                                    self.jpyLabel.text = "JPY : \(jpy)"
                                }
                                
                                if let usd = rates["USD"] as? Double {
                                    self.usdLabel.text = "USD : \(usd)"
                                }
                                
                                if let tl = rates["TRY"] as? Double {
                                    self.tryLabel.text = "TRY : \(tl)"
                                }
                                
                                
                            }
                            
                            
                            
                        }
                        
                    } catch{
                        
                    }
                
                   
           
                    
                }
                
                
            }
            
    
        }
        
        task.resume() // task işlemini başlatır. unutmamak gerekir.
        
    }
    

}

