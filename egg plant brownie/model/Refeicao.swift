//
//  Refeicao.swift
//  egg plant brownie
//
//  Created by Rodrigo Amora on 01/08/22.
//

import UIKit

class Refeicao: NSObject {
    
    let nome: String
    let felicidade: String
    let items: Array<Item> = []
    
    init(nome: String, felicidade: String) {
        self.nome = nome
        self.felicidade = felicidade
    }
    
    func totalDeCalorias() -> Double {
        var total = 0.0
        
        for item in items {
            total += item.calorias
        }
        
        return total
    }
}
