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
    let setHeight = UIScreen.main.bounds.height
    let setWidth = UIScreen.main.bounds.width
    var segmentNum = Int()
    var numScreens = Int()
    var URLs: [String?] = []
    //holds all subviews
    var webviewArray: [WKWebView] = []
    var defaultURL = "https://www.google.com"
    
    @IBOutlet weak var toolbar: UIToolbar!
    
    
    @IBAction func removeWebview(_ sender: Any) {
        //can either do this as an alert or a pop over (lets try popover)
        
    }
    
    @IBAction func addWebview(_ sender: Any) {
        //check to see if we should even add
        if webviewArray.count == 3{
            return
        }
        
        //create new webview object
        webviewArray.append(WKWebView())
        //adjust numscreens to account for new # of views
        numScreens += 1
        
        //will need to check for orientation and then update frames
        if UIDevice.current.orientation.isLandscape {
            landscapeOrientation()
        } else {
            portraitOrientation()
        }
        //load google as default search engine
        //let newURL = URL(string: URLs[i]!)
        //let newRequest = URLRequest(url: newURL!)
        webviewArray[2].load(URLRequest(url: URL(string: defaultURL)!))
        //finally add the latest webview as a subview
        self.view.addSubview(webviewArray[2])
        //keep toolbar in front
        self.view.bringSubviewToFront(toolbar)
    }
    
    
    
    
    @IBAction func returnToConfig(_ sender: Any) {
        for i in 0...(presentingViewController as! configViewController).urlArray.count-1{
            (presentingViewController as! configViewController).urlArray[i].text = URLs[i]
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func initialSetupScreens(){
        let maxWidth = UIScreen.main.bounds.width
        let maxHeight = UIScreen.main.bounds.height/CGFloat(numScreens)
        
        //create each subView
        for i in 0...numScreens-1{
            webviewArray.append(WKWebView())
            webviewArray[i].frame = CGRect(x: 0, y: maxHeight*CGFloat(i), width: maxWidth, height: maxHeight)
            let newURL = URL(string: URLs[i]!)
            let newRequest = URLRequest(url: newURL!)
            webviewArray[i].load(newRequest)
            self.view.addSubview(webviewArray[i])
        }
    }
    func checkURL(_ integer: Int)->(URL){
        if URLs[integer]?.isEmpty == true{
            return URL(string: defaultURL)!
        }
        return URL(string: URLs[integer]!)!
    }
    
    func landscapeOrientation(){
        //set variable widths
        let newWidth = setHeight/CGFloat(numScreens)
        let newHeight = setWidth
        for i in 0...numScreens-1{
            webviewArray[i].frame = CGRect(x: newWidth*CGFloat(i), y: 0, width: newWidth, height: newHeight)
        }
    }
    
    func portraitOrientation(){
        // same as initial setup
        let newWidth = setWidth
        let newHeight = setHeight/CGFloat(numScreens)
        for i in 0...numScreens-1{
            webviewArray[i].frame = CGRect(x: 0, y: newHeight*CGFloat(i), width: newWidth, height: newHeight)
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.orientation.isLandscape {
            landscapeOrientation()
        } else {
            portraitOrientation()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //determine how many screens are wanted
        if segmentNum == 0{
            numScreens = 2
        } else {
            numScreens = 3
        }
        initialSetupScreens()
        view.backgroundColor = UIColor.cyan
        self.view.bringSubviewToFront(toolbar)
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
