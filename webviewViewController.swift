//
//  webviewViewController.swift
//  autoLayout
//
//  Created by excelencia on 24/06/16.
//  Copyright © 2016 excelencia. All rights reserved.
//

import UIKit

class webviewViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var menuBtn: UIBarButtonItem!

    @IBOutlet var customWebview: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if self.revealViewController() != nil {
            
            menuBtn.target = self.revealViewController();
            menuBtn.action = #selector(SWRevealViewController.revealToggle(_:));
            
            self.revealViewController().panGestureRecognizer().enabled = false;

           // self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer());
            
            //self.view.removeGestureRecognizer(self.revealViewController().panGestureRecognizer());
        }
        
        let url = NSURL(string: "www.apple.com");
        let req = NSURLRequest(URL: url!);
        
        customWebview.loadRequest(req);
        
        customWebview.loadRequest(NSURLRequest(URL: NSURL(string: "http://www.google.com")!))

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func reloadingPage(sender: AnyObject) {
        
        customWebview.reload();
        
    }
    @IBAction func stopLoading(sender: AnyObject) {
        
        customWebview.stopLoading();
    }
    @IBAction func goBack(sender: AnyObject) {
        
        if customWebview.canGoBack {
            customWebview.goBack();
        }
    }

    @IBAction func goForward(sender: AnyObject) {
        
        if customWebview.canGoForward {
            customWebview.goForward();
        }
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        
        print("Error :\(error)");
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
