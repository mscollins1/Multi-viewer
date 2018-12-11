//
//  TutorialThirdScene.swift
//  Multi-viewer
//
//  Created by Skotny, Benjamin on 12/9/18.
//  Copyright © 2018 Mike Scollins. All rights reserved.
//

import UIKit

class TutorialThirdScene: UIViewController {
    //this is the connector for the first text field below the image
    @IBOutlet weak var textFieldOutput: UILabel!
    
    //user goes back to the previous scene
    @IBAction func BackToTutorialSecondScene(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
   
    //user goes back to the configuration page
    @IBAction func BackToConfigurationPage(_ sender: Any) {
        performSegue(withIdentifier: "WebsiteToConfig", sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //ouput shown in the text field to the user
        textFieldOutput.text = "1) After entering valid websites and clicking on Confirms URLs, the URLs will be displayed. In this case, www.youtube.com and www.google.com were put into the URL fields.\n2) At the bottom, there are multiple options to click on."
        
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
