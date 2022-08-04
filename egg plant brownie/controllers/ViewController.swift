//
//  ViewController.swift
//  egg plant brownie
//
//  Created by Rodrigo Amora on 25/07/22.
//

import UIKit

class ViewController: UIViewController {
    
    var refeicaoTableViewController: RefeicoesTableViewController?
    
    @IBOutlet weak var nomeTextField: UITextField?
    @IBOutlet weak var feilicidadeTextField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func adicionar(_ sender: Any) {
        /*
        if let nomeDaRefeicao = nomeTextField?.text, let felicidadeDaRefeicao = felicidadeTextField?.text {
            let nome = nomeDaRefeicao
            let felicidade = felicidadeDaRefeicao
            
            let refeicao = Refeicao(nome: nome, felicidade: felicidade)
            
            print("comi \(refeicao.nome) e fiquei com felicidade: \(refeicao.felicidade)")
        } else {
            print("erro ao tentar criar refeicao")
        }
        */
        
        guard let nomeDaRefeicao = nomeTextField?.text else {
            return
        }
        
        guard let felicidadeDaRefeicao = feilicidadeTextField?.text, let felicidade = Int(felicidadeDaRefeicao) else {
            return
        }
        
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade)
        
        print("comi \(refeicao.nome) e fiquei com felicidade: \(refeicao.felicidade)")
        
        refeicaoTableViewController?.add(refeicao)
        navigationController?.popViewController(animated: true)
    }

}

