//
//  Refeicao.swift
//  egg plant brownie
//
//  Created by Rodrigo Amora on 01/08/22.
//

import UIKit

class Refeicao: NSObject, NSCoding {
    
    var nome: String = ""
    var felicidade: Int = 0
    var itens: Array<Item> = []
    
    init(nome: String, felicidade: Int, itens: [Item] = []) {
        self.nome = nome
        self.felicidade = felicidade
        self.itens = itens
    }
    
    // MARK: - NSCondimg
    func encode(with coder: NSCoder) {
        coder.encode(nome, forKey: "nome")
        coder.encode(felicidade, forKey: "felicidade")
        coder.encode(itens, forKey: "itens")
    }
    
    required init?(coder: NSCoder) {
        coder.decodeObject(forKey: "nome")
        coder.decodeObject(forKey: "felicidade")
        coder.decodeObject(forKey: "itens")
    }
    
    // MARK: - Methods
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
