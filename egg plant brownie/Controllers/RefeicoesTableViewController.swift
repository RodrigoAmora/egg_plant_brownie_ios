//
//  RefeicaoTableViewController.swift
//  egg plant brownie
//
//  Created by Rodrigo Amora on 04/08/22.
//

import UIKit

class RefeicoesTableViewController: UITableViewController, AdicionaRefeicaoDelegate {
    
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
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(mostrarDetalhes(_:)))
        celula.addGestureRecognizer(longPress)
        
        return celula
    }
    
    func add(_ refeicao: Refeicao) {
        refeicoes.append(refeicao)
        tableView.reloadData()
    }
    
    @objc func mostrarDetalhes(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            let celula = gesture.view as! UITableViewCell
            guard let indexPath = tableView.indexPath(for: celula) else { return }
            let refeicao = refeicoes[indexPath.row]
            
            
            
            
            let alert = UIAlertController(title: refeicao.nome,
                                          message: refeicao.detalhes(),
                                          preferredStyle: .alert)
            
            let botaoCancelar = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alert.addAction(botaoCancelar)
            
            present(alert, animated: true, completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "adicionar" {
            if let viewController = segue.destination as? ViewController {
                viewController.delegate = self
            }
        }
    }
}
