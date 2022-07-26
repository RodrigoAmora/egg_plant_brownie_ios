//
//  Refeicao.swift
//  egg plant brownie
//
//  Created by Rodrigo Amora on 01/08/22.
//

import UIKit

class Refeicao: NSObject {
    
    let nome: String
    let felicidade: Int
    var itens: Array<Item> = []
    
    init(nome: String, felicidade: Int, itens: [Item] = []) {
        self.nome = nome
        self.felicidade = felicidade
        self.itens = itens
    }
    
    func totalDeCalorias() -> Double {
        var total = 0.0
        
        for item in itens {
            total += item.calorias
        }
        
        return total
    }
    
    func detalhes() -> String {
        var mensagem = "Felicidade: \(felicidade) \n"
        for item in itens {
            mensagem += ", \(item.nome) - calorias: \(item.calorias)"
        }
        return mensagem
    }
}
