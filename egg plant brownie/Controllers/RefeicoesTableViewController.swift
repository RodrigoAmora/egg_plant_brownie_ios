//
//  RefeicaoTableViewController.swift
//  egg plant brownie
//
//  Created by Rodrigo Amora on 04/08/22.
//

import UIKit

class RefeicoesTableViewController: UITableViewController {
    
    var refeicoes = [Refeicao(nome: "Hot Dog", felicidade: 5),
                     Refeicao(nome: "Hamburguer", felicidade: 5),
                     Refeicao(nome: "Sorvete", felicidade: 5)]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let refeicao = refeicoes[indexPath.row]
        
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        celula.textLabel?.text = refeicao.nome
        
        return celula
    }
    
    func add(_ refeicao: Refeicao) {
        refeicoes.append(refeicao)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? ViewController {
            viewController.refeicaoTableViewController = self
        }
    }
}
