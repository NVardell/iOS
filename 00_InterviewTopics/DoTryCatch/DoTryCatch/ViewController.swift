//
//  ViewController.swift
//  DoTryCatch
//
//  Created by Nate Vardell on 12/7/21.
//

import UIKit

class ViewController: UIViewController {

    
    enum LoginError: Error {
        case incompleteForm
        case invalidEmail
        case incorrectPasswordLength
    }
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loginButtonPressed(_ sender: UIButton) {
        do {
            let imageData = try Data(contentsOf: URL(fileURLWithPath: "filePathHere"))
            // Do whatever you want with ImageData because the try succeeded
        } catch {
            // Handle the error
            print(error.localizedDescription)
        }
    }
    
    func login() throws {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        if email.isEmpty || password.isEmpty { throw LoginError.incompleteForm }
        if !email.isValidEmail { throw LoginError.invalidEmail }
        if password.count < 8 { throw LoginError.incorrectPasswordLength }
        
        // Pretend credentials are ALWAYS AMAZING
        // It's truly amazing magically...
        
    }
}

