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


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: - Artibutos
    var delegate: AdicionaRefeicaoDelegate?
    var itens: [Item] = [Item(nome: "Arroz", calorias: 50.6),
                         Item(nome: "Feijão", calorias: 50.6),
                         Item(nome: "Bife", calorias: 50.6),
                         Item(nome: "Batata Frita", calorias: 50.6)]
    
    var itensSelecionados: Array<Item> = []
    
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
        
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade, itens: itensSelecionados)
        
        print("comi \(refeicao.nome) e fiquei com felicidade: \(refeicao.felicidade)")
        
        delegate?.add(refeicao)
        navigationController?.popViewController(animated: true)
    }

    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item: Item = itens[indexPath.row]
        
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        celula.textLabel?.text = item.nome
        
        return celula
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let celula = tableView.cellForRow(at: indexPath) else {
            return
        }
        
        if celula.accessoryType == .none {
            celula.accessoryType = .checkmark
            itensSelecionados.append(itens[indexPath.row])
        } else {
            celula.accessoryType = .none
            
            let item = itens[indexPath.row]
            if let position = itensSelecionados.index(of: item) {
                itensSelecionados.remove(at: position)
            }
        }
    }
}

