//
//  TutorialSeventhScene.swift
//  Multi-viewer
//
//  Created by Skotny, Benjamin on 12/9/18.
//  Copyright © 2018 Mike Scollins. All rights reserved.
//

import UIKit

class TutorialSeventhScene: UIViewController {

    //user goes back to configuration page 
    @IBAction func hideToConfigPage(_ sender: Any) {
        performSegue(withIdentifier: "HideToConfig", sender: nil)
    }
    
    //user goes back to previous scene
    @IBAction func BackToSixthScene(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
