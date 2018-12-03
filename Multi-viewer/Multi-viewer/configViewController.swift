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
    var urlArray: [UITextField] = []
    
    var defaultURL = "https://www.google.com"
    
    @IBAction func checkURLAndSegue(_ sender: Any) {
        setURLArray()
        for i in 0...urlArray.count-1{
            checkURL(urlArray[i].text, i)
        }

        performSegue(withIdentifier: "multiview", sender: nil)

    }
    func setURLArray(){
        urlArray = []
        let numScreens = getNumScreens()
        urlArray.append(url1)
        urlArray.append(url2)
        if numScreens == 3{
            urlArray.append(url3)
        }
    }
    
    func getNumScreens()->Int{
        if numberOfScreensSegment.selectedSegmentIndex == 0{
            return 2
        } else {
            return 3
        }
    }
    
    func checkURL(_ url: String?, _ index: Int){
        if url?.isEmpty == false{
            if((url!.range(of: "https://")) != nil){
                if UIApplication.shared.canOpenURL(URL(string: "\(url!)")!) == true{
                    //valid url with https:// already in front
                    return
                }
            } else if let urlstring = URL(string: "https://\(url!)"){
                if UIApplication.shared.canOpenURL(urlstring) == true{
                    //another valid url, but need to append https to beginning
                    urlArray[index].text = "https://\(urlArray[index].text!)"
                    print("\(url!) is another valid url, but need to append https to beginning: \(urlArray[index].text!)")
                    return
                }
            }
        } else if url?.isEmpty == true {
            //set the URL to google since left blank
            urlArray[index].text = defaultURL
            return
        }
        //we must alert/prompt user to change their URL
        badURL(url!, index)
    }
    
    func badURL(_ url: String, _ index: Int){
        //create an alert controller onject
        let alertContrller = UIAlertController(title: "One or More Bad URL(s)", message: "Type in a valid URL (or leave blank to default to google):", preferredStyle: UIAlertController.Style.alert)
        alertContrller.addTextField(configurationHandler: {(textField: UITextField) in
            textField.placeholder = "https://www.google.com"
            textField.keyboardType = UIKeyboardType.URL
        })
        let defaultAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {(alertAction: UIAlertAction) in
            let actionURL: String = alertContrller.textFields![0].text!
            self.urlArray[index].text = actionURL
        })
        
        alertContrller.addAction(defaultAction)
        present(alertContrller, animated: true, completion: nil)
        //return "this is a placeholder return function so swift can compile"
        
    }
    
    @IBAction func helpButton(_ sender: Any) {
        //create an alert controller onject
        let alertContrller = UIAlertController(title: "Instructions", message: "Type in one or multiple URLS and click the apply button to show them on another screen", preferredStyle: UIAlertController.Style.alert)
        
        //set up button
        let defaultAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        
        //add button to alert controller
        alertContrller.addAction(defaultAction)
        
        //display alert controller
        present(alertContrller, animated: true, completion: nil)
    }
    
    
    @IBAction func keyboardEnter(_ sender: UITextField) {
        //dismisses keyboard after hitting enter
        sender.resignFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.destination is multiViewController{
            let multivc = segue.destination as! multiViewController
            multivc.segmentNum = numberOfScreensSegment.selectedSegmentIndex
            multivc.URLs.append("\(String(describing: url1.text!))")
            multivc.URLs.append("\(String(describing: url2.text!))")
            multivc.URLs.append("\(String(describing: url3.text!))")
        }
        
    }
    

}
