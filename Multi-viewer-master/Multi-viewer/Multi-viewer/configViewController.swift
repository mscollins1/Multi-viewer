//
//  configViewController.swift
//  Multi-viewer
//
//  Created by Mike Scollins on 11/26/18.
//  Copyright © 2018 Mike Scollins. All rights reserved.
//

import UIKit

class configViewController: UIViewController {
    @IBOutlet weak var numberOfScreensSegment: UISegmentedControl!
    @IBOutlet weak var url1: UITextField!
    @IBOutlet weak var url2: UITextField!
    @IBOutlet weak var url3: UITextField!
    
    
    @IBAction func helpButton(_ sender: Any) {
        //create an alert controller onject
        let alertContrller = UIAlertController(title: "Instructions", message: "Type in one or multiple URLS and click the apply button to show them on another screen", preferredStyle: UIAlertControllerStyle.alert)
        
        //set up button
        let defaultAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        
        //add button to alert controller
        alertContrller.addAction(defaultAction)
        
        //display alert controller
        present(alertContrller, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.destination is multiViewController{
            let multivc = segue.destination as! multiViewController
            multivc.segmentNum = numberOfScreensSegment.selectedSegmentIndex
            multivc.URLs.append(url1.text)
            multivc.URLs.append(url2.text)
            multivc.URLs.append(url3.text)

        }
        
    }
    

}
