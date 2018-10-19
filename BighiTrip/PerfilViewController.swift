//
//  PerfilViewController.swift
//  BighiTrip
//
//  Created by Lucas Marques Bighi on 10/10/2018.
//  Copyright © 2018 Lucas Marques Bighi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class PerfilViewController: UITableViewController {
    
    @IBOutlet weak var txtLogin: UITextField!
    @IBOutlet weak var txtNome: UITextField!
    
    var ref:DatabaseReference?
    
    @IBAction func atualizar(_ sender: Any) {
        ref = Database.database().reference()
        
        ref?.child("usuarios").childByAutoId().setValue(txtNome.text)
    }
    
    @IBAction func sair(_ sender: UIButton) {
        let firebaseAuth = Auth.auth()
        do{
            try firebaseAuth.signOut()
            self.performSegue(withIdentifier: "sairSegue", sender: self)
        } catch let signOutError as NSError{
            print("Erro ao sair: ", signOutError)
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
