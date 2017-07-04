//
//  ViewController.swift
//  Scheduler
//
//  Created by Waseem Syed on 7/4/16.
//  Copyright © 2016 Waseem Syed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK:- IBOutlets
    
    @IBOutlet weak var SaksModuleLabel: UILabel!
    @IBOutlet weak var HomePageImage: UIImageView!
 
   // MARK: - View Controller Life Cycle functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
   }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
  
   // MARK: - IBActions
    
    @IBAction func SaksCheckoutRegButton(sender: UIButton) {
       
        SaksModuleLabel.text="Module Scheduled successfully"
        var url: NSURL = NSURL(string: "http://automation.digital.hbc.com/MobileApp/SaksCheckoutReg.php")!
        var request:NSMutableURLRequest = NSMutableURLRequest(URL:url)
        var bodyData = "data=something"
        request.HTTPMethod = "POST"
        
        request.HTTPBody = bodyData.dataUsingEncoding(NSUTF8StringEncoding);
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue())
        {
            (response, data, error) in
            print(response)
            
            if let HTTPResponse = response as? NSHTTPURLResponse {
                let statusCode = HTTPResponse.statusCode
                
                if statusCode == 200 {
                    print("Module Scheduled Successfully")
                }
                else{
                    print("Fail")
                }
            }
            else{
                print("Fail")
            }
        }
     }
 }

