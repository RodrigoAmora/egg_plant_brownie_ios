//
//  ViewController.swift
//  egg plant brownie
//
//  Created by Rodrigo Amora on 25/07/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var nomeTextField: UITextField!
    @IBOutlet var felicidadeTextField: UITextField!
    
    @IBAction func adicionar(_ sender: Any) {
        let nome = nomeTextField.text
        let felicidade =  felicidadeTextField.text
        
        print("comi \(nome) e fiquei com felicidade: \(felicidade)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

