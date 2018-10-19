//
//  CadastroViewController.swift
//  BighiTrip
//
//  Created by Lucas Marques Bighi on 05/10/2018.
//  Copyright © 2018 Lucas Marques Bighi. All rights reserved.
//

import UIKit
import CoreData
import FirebaseAuth

class CadastroViewController: UIViewController {

    @IBOutlet weak var imgUsuario: UIImageView!
    @IBOutlet weak var txtNomeUsuario: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtSenha: UITextField!
    @IBOutlet weak var txtConfSenha: UITextField!
    @IBOutlet weak var confCadastro: UIButton!
    @IBOutlet weak var lblVerifica: UILabel!
    
    
    var avatar = ""
    var nome = ""
    var usuario = ""
    var email = ""
    var senha = ""
    
    @IBAction func cadastrar(_ sender: Any) {
        validaCadastro()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func typingConfSenha(_ sender: UITextField) {
        if txtSenha.text == txtConfSenha.text {
            lblVerifica.text = "As senhas conferem"
        } else {
            lblVerifica.text = "As senhas não conferem"
        }
    }
    
    private func validaCadastro(){
        if txtNomeUsuario.text != "" && txtEmail.text != "" && txtSenha.text != "" && txtConfSenha.text != "" {
            Auth.auth().createUser(withEmail: txtEmail.text!, password: txtSenha.text!) {(user, error) in
                if user != nil {
                    self.performSegue(withIdentifier: "cadastroSegue", sender: self)
                } else {
                    print(error?.localizedDescription as Any)
                    switch (error?.localizedDescription){
                    case "Senha precisa de no mínimo 6 caracteres":
                        self.lblVerifica.text = "Usuário não encontrado"
                    case "There is no user record corresponding to this identifier. The user may have been deleted.":
                        self.lblVerifica.text = "Usuário não encontrado"
                    case "The email address is badly formatted.":
                        self.lblVerifica.text = "Insira um e-mail valido"
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
