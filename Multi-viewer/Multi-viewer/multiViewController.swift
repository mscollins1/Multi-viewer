//
//  multiViewController.swift
//  Multi-viewer
//
//  Created by Mike Scollins on 11/26/18.
//  Copyright © 2018 Mike Scollins. All rights reserved.
//

import UIKit
import WebKit

class multiViewController: UIViewController {
    var segmentNum = Int()
    
    func setup2Screens(){
        //progrommatically add webviews
        let webview1 = WKWebView()
        webview1.frame  = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100)
        let newURL = URL(string:"https://www.google.com")
        let newRequest = URLRequest(url: newURL!)
        webview1.load(newRequest)
        self.view.addSubview(webview1)
    }
    
    func setup3Screens(){
        //progrommatically add webviews
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //testLabel.text = String( (presentingViewController as! configViewController).numberOfScreensSegment.selectedSegmentIndex)
        //testLabel2.text = "hi"
        if (segmentNum == 0){
            //user wants 2 screens
            setup2Screens()
        } else {
            //user wants 3 screens
            setup3Screens()
        }
        view.backgroundColor = UIColor.cyan
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
