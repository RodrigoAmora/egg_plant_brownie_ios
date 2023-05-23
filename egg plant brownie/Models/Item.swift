//
//  Item.swift
//  egg plant brownie
//
//  Created by Rodrigo Amora on 01/08/22.
//

import UIKit

class Item: NSObject, NSCoding {
    
    // MARK: - Atributos
    let nome: String
    let calorias: Double
    
    // MARK: - Init
    init(nome: String, calorias: Double) {
        self.nome = nome
        self.calorias = calorias
    }
    
    // MARK: - NSCondimg
    func encode(with coder: NSCoder) {
        coder.encode(nome, forKey: "nome")
        coder.encode(calorias, forKey: "calorias")
    }
    
    required init?(coder: NSCoder) {
        nome = coder.decodeObject(forKey: "nome") as! String
        calorias = coder.decodeDouble(forKey: "calorias")
    }
    
}
