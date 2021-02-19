//
//  LoginViewController.swift
//  Twitter
//
//  Created by Jennifer Lopez on 2/17/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var mainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mainButton.layer.cornerRadius = 10
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // if standard true
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true {
            // don't ask to log in, go to homescreen
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }
    }
    
    // Login Button function
    @IBAction func onLoginButton(_ sender: Any) {
        
        let myUrl = "https://api.twitter.com/oauth/request_token"
        TwitterAPICaller.client?.login(url: myUrl, success: {
            
            // will check if user already logged in
            // user stays logged in restarts, set standard to true
            UserDefaults.standard.set(true, forKey: "userLoggedIn")
            
            // when user logs in successfully: login -> homescreen
            self.performSegue(withIdentifier: "loginToHome", sender: self)
            
        }, failure: { (Error) in
            print("Could not log in!")
        })
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
