//
//  ViewController.swift
//  gatewayRazorpayPayment
//
//  Created by Arpit iOS Dev. on 27/06/24.
//

import UIKit
import Razorpay

class ViewController: UIViewController {
    
    
    private var razorPay : RazorpayCheckout?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        razorPay = RazorpayCheckout.initWithKey("<replace the actual key>", andDelegate: self)
    }
    @IBAction func clickedPayNow(_ sender: UIButton) {
        let options:[String:Any] = ["amount" : "100",
                                    "description" : "for test purpose",
                                    "image": UIImage(named: "img"),
                                    "name" : "business name",
                                    "prefill" :
                                        ["contact" : "7874718104",
                                         "email":"demo@inm.com"],
                                    "theme" : "#F00000"]
        razorPay?.open(options)
    }
}


extension ViewController : RazorpayPaymentCompletionProtocol {
    func onPaymentError(_ code: Int32, description str: String) {
        let alert = UIAlertController(title: "Error", message: "\(code)\n\(str)", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func onPaymentSuccess(_ payment_id: String) {
        let alert = UIAlertController(title: "SUCCESS!", message: "Payment is successful", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
}
