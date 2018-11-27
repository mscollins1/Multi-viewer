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
    var numScreens = Int()
    var URLs: [String?] = []
    //holds all subviews
    var webviewArray: [WKWebView] = []
    var defaultURL = "https://www.google.com"
    
    func setupScreens(){
        let maxWidth = UIScreen.main.bounds.width
        let maxHeight = UIScreen.main.bounds.height/CGFloat(numScreens)
        
        //create each subView
        for i in 0...numScreens-1{
            webviewArray.append(WKWebView())
            webviewArray[i].frame = CGRect(x: 0, y: maxHeight*CGFloat(i), width: maxWidth, height: maxHeight)
            let newURL = checkURL(i)
            let newRequest = URLRequest(url: newURL)
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
        //let newWidth = UIScreen.main.bounds.width
    }
    
    func portraitOrientation(){
        // same as initial setup
        
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
        setupScreens()
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
