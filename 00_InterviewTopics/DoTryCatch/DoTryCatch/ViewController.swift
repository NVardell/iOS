//
//  ViewController.swift
//  DoTryCatch
//
//  Created by Nate Vardell on 12/7/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    enum LoginError: Error {
        case incompleteForm
        case invalidEmail
        case incorrectPasswordLength
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loginButtonPressed(_ sender: UIButton) {
        do {
            try login()
        } // Handle errors
        catch LoginError.incompleteForm {
            Alert.showBasic(title: "Incomplete Form", message: "Please fill out both email & password.", vc: self) }
        catch LoginError.invalidEmail {
            Alert.showBasic(title: "Invalid Email", message: "Please make sure email is in correct format.", vc: self) }
        catch LoginError.incorrectPasswordLength {
            Alert.showBasic(title: "Password Length", message: "Password should be at least 8 characters.", vc: self) }
        catch {
            Alert.showBasic(title: "Unable to Login", message: "There was an error when logging in.", vc: self) }
    }
    
    func login() throws {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        if email.isEmpty || password.isEmpty { throw LoginError.incompleteForm }
        if !email.isValidEmail { throw LoginError.invalidEmail }
        if password.count < 8 { throw LoginError.incorrectPasswordLength }
        
        // Pretend credentials are AMAZING
        // It's truly a magical login...
        
    }
}

