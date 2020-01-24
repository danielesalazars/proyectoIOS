//
//  ViewController.swift
//  proyecto
//
//  Created by Daniel Eduardo Salazar Salabarriga on 1/23/20.
//  Copyright © 2020 Daniel Eduardo Salazar Salabarriga. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet weak var tfCorreo: UITextField!
    @IBOutlet weak var tfClave: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func loginAction(_ sender: Any) {
        guard let username = tfCorreo.text, !username.isEmpty else {
            return
        }
        guard let password = tfClave.text, !password.isEmpty else {
            return
        }
        
        Auth.auth().signIn(withEmail: username, password: password) { (auth, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let auth = auth else {
                return
            }
            let stb = UIStoryboard(name: "Main", bundle: nil)
            let controller = stb.instantiateViewController(withIdentifier: "tabBarID")
            self.present(controller, animated: true, completion: nil)
        }
    }
    
}
