//
//  ViewController.swift
//  egg plant brownie
//
//  Created by Rodrigo Amora on 25/07/22.
//

import UIKit

protocol AdicionaRefeicaoDelegate {
    func add(_ refeicao: Refeicao)
}


class ViewController: UIViewController, UITableViewDataSource {

    // MARK: - Artibutos
    var delegate: AdicionaRefeicaoDelegate?
    var itens: [Refeicao] = [Refeicao(nome: "Arroz", felicidade: 5),
                             Refeicao(nome: "Feijão", felicidade: 5),
                             Refeicao(nome: "Bife", felicidade: 5),
                             Refeicao(nome: "Batata Frita", felicidade: 5),]
    
    // MARK: - IBOutlets
    @IBOutlet weak var nomeTextField: UITextField?
    @IBOutlet weak var feilicidadeTextField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - IBActions
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
        
        delegate?.add(refeicao)
        navigationController?.popViewController(animated: true)
    }

    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item: Refeicao = itens[indexPath.row]
        
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        celula.textLabel?.text = item.nome
        
        return celula
    }
    
}

