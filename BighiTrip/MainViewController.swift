//
//  MainViewController.swift
//  BighiTrip
//
//  Created by Lucas Marques Bighi on 05/10/2018.
//  Copyright © 2018 Lucas Marques Bighi. All rights reserved.
//

import UIKit
import CoreData
import FirebaseAuth

class MainViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtSenha: UITextField!
    @IBOutlet weak var lblVerifica: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func entrar(_ sender: UIButton) {
        validaCadastro()
    }
    
    @IBAction func facebook(_ sender: Any) {
        lblVerifica.text = "Não implementado ainda"
    }
    
    
    private func validaCadastro(){
            if txtEmail.text != "" && txtSenha.text != "" {
                Auth.auth().signIn(withEmail: txtEmail.text!, password: txtSenha.text!) {(user, error) in
                    if user != nil {
                        self.performSegue(withIdentifier: "loginSegue", sender: self)
                    } else {
                        print(error?.localizedDescription as Any)
                        switch (error?.localizedDescription){
                        case "There is no user record corresponding to this identifier. The user may have been deleted.":
                            self.lblVerifica.text = "Usuário não encontrado"
                        case "The email address is badly formatted.":
                            self.lblVerifica.text = "Insira um e-mail valido"
                        case "The password is invalid or the user does not have a password.":
                            self.lblVerifica.text = "Senha inválida"
                        case .none:
                            self.lblVerifica.text = .none
                        case .some(_):
                            self.lblVerifica.text = ".some"
                            
                        }
                    }
                }
            } else {
                lblVerifica.text = "Preencha todos os campos"
            }
        }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}

