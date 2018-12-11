//
//  TutorialSecondView.swift
//  Multi-viewer
//
//  Created by Skotny, Benjamin on 12/9/18.
//  Copyright © 2018 Mike Scollins. All rights reserved.
//

import UIKit

class TutorialSecondView: UIViewController {

    //this is the connector for the first text field below the first image
    @IBOutlet weak var textOutputFirst: UILabel!
    
    //this is the connector for the second text field below the second image
    @IBOutlet weak var textOutputSecond: UILabel!
    
    
    //user goes back to the previous scene
    @IBAction func BackToTutorialFirstScene(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    //user goes back to the configuration page
    @IBAction func BackToConfigurationPage(_ sender: Any) {
        performSegue(withIdentifier: "BackToConfigPage", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //output for the first and second text fields
        textOutputFirst.text = "1) If a URL invalid, a pop up will appear to allow you to enter a valid one."
        textOutputSecond.text = "2) Click OK after you enter a URL, and then click Confirm URLs."
      
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
