//
//  RegisterVC.swift
//  e-Shop
//
//  Created by Arvydas Klimavicius on 2020-02-07.
//  Copyright © 2020 Arvydas Klimavicius. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegisterVC: UIViewController {

    //Outlets

    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var confirmPasswodrTxt: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var passCheckImage: UIImageView!
    @IBOutlet weak var confirmPassCheckImage: UIImageView!




    override func viewDidLoad() {
        super.viewDidLoad()

        passwordTxt.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        confirmPasswodrTxt.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)


    }

    @objc func textFieldDidChange(_ textField: UITextField) {
        guard let passText = passwordTxt.text else { return }



        if textField == confirmPasswodrTxt {
            passCheckImage.isHidden = false
            confirmPassCheckImage.isHidden = false
        } else {
            if passText.isEmpty {
                passCheckImage.isHidden = true
                confirmPassCheckImage.isHidden = true
                confirmPasswodrTxt.text = ""
            }
        }

        if passwordTxt.text == confirmPasswodrTxt.text {
            passCheckImage.tintColor = .green
            confirmPassCheckImage.tintColor = .green
        } else {
            passCheckImage.tintColor = .red
            confirmPassCheckImage.tintColor = .red
        }

    }

    @IBAction func registerTapped(_ sender: Any) {

        guard let email = emailTxt.text , email.isNotEmpty ,
            let username = usernameTxt.text, username.isNotEmpty ,
            let password = passwordTxt.text , password.isNotEmpty else { return }

        activityIndicator.startAnimating()

        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                debugPrint(error)
                return

            }
            self.activityIndicator.startAnimating()
            print("Registered new User")
        }



    }

}
