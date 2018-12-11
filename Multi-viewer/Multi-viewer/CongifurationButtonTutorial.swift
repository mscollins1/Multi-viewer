//
//  TutorialSixthScene.swift
//  Multi-viewer
//
//  Created by Skotny, Benjamin on 12/9/18.
//  Copyright © 2018 Mike Scollins. All rights reserved.
//

import UIKit

class TutorialSixthScene: UIViewController {
    //this is the connector for the first text field
    @IBOutlet weak var outputTextField: UILabel!
    
    //user goes back to previous scene
    @IBAction func BackToTutorialFifthScene(_ sender: Any) {
         self.dismiss(animated: true, completion: nil)
    }
    
    //user goes back to configuration page 
    @IBAction func BackToConfigurationPage(_ sender: Any) {
        performSegue(withIdentifier: "ConfigToConfig", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //ouput shown in the text field to the user
        outputTextField.text = "After clicking on Config Page, you will be brought back to the configuration page. The URLs that you had on the previous screen are filled in for you. "
        
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
