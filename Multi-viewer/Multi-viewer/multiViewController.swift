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
    let contentController = WKUserContentController()
    let config = WKWebViewConfiguration()

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
        if webviewArray.count == 2{
            //maybe show an alert here to tell user they can't remove anymore webviews
            return
        }
        
        let alertContrller = UIAlertController(title: "Remove a Webview", message: "Choose which webview to remove:", preferredStyle: UIAlertController.Style.alert)
        
        var alertButtonsArray: [UIAlertAction] = []
        
        for i in 0...numScreens-1{
            //add buttons with action to remove selected subview, then call the landscape/portrait function to resize frames
            alertButtonsArray.append(UIAlertAction(title: "\(i+1)", style: UIAlertAction.Style.default, handler: { (UIAlertAction) in
                //first remove the subview
                self.webviewArray[i].removeFromSuperview()
                //then remove from array
                self.webviewArray.remove(at: i)
                //update numScreens Counter
                self.numScreens -= 1
                //resize the rest of the subviews
                self.resizeViews()
            }))
            alertContrller.addAction(alertButtonsArray[i])
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
        
        alertContrller.addAction(cancelAction)
        present(alertContrller, animated: true, completion: nil)
    }
    
    @IBAction func addWebview(_ sender: Any) {
        //check to see if we should even add
        if webviewArray.count == 3{
            //maybe show an alert here to tell user they can't add anymore webviews
            return
        }
        
        //create new webview object
        webviewArray.append(WKWebView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), configuration: config))
        //adjust numscreens to account for new # of views
        numScreens += 1
        
        //will need to check for orientation and then update frames
        resizeViews()
        //load google as default search engine
        //let newURL = URL(string: URLs[i]!)
        //let newRequest = URLRequest(url: newURL!)
        webviewArray[2].load(URLRequest(url: URL(string: defaultURL)!))
        //finally add the latest webview as a subview
        self.view.addSubview(webviewArray[2])
        //keep toolbar in front
        self.view.bringSubviewToFront(toolbar)
        //add ability to go forward/backward through webpages
        webviewArray[2].allowsBackForwardNavigationGestures = true
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
        
        //setup configs for webview
        config.allowsInlineMediaPlayback = true
        
        //create each subView
        for i in 0...numScreens-1{
            webviewArray.append(WKWebView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), configuration: config))
            webviewArray[i].frame = CGRect(x: 0, y: maxHeight*CGFloat(i), width: maxWidth, height: maxHeight)
            var newRequest: URLRequest
            if let newURL = URL(string: URLs[i]!){
                newRequest = URLRequest(url: newURL)
            } else {
                newRequest = URLRequest(url: URL(string: defaultURL)!)
            }
            webviewArray[i].load(newRequest)
            self.view.addSubview(webviewArray[i])
            //finally add ability to use gesture of going forward/backward
            webviewArray[i].allowsBackForwardNavigationGestures = true
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
    
    func resizeViews(){
        if UIDevice.current.orientation.isLandscape {
            landscapeOrientation()
        } else {
            portraitOrientation()
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        resizeViews()
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
