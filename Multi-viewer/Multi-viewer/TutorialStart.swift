//
//  TutorialFirstScene.swift
//  Multi-viewer
//
//  Created by Skotny, Benjamin on 12/9/18.
//  Copyright © 2018 Mike Scollins. All rights reserved.
//

import UIKit

class TutorialFirstScene: UIViewController {
    //this is the connector for the text field
    @IBOutlet weak var textOutout: UILabel!
    
    
    //previous button action
    @IBAction func BackToConfig(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //output shown on screen using the text field
        textOutout.text = "1) Choose number of screens.\n2) Enter two or three URLs depending on # of screens chosen in the format of www.abc.com.\n3)A blank URL will be defaulted to www.google.com.\n4) Click on Confirm URLs to show websites on another page."
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
