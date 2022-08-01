//
//  Item.swift
//  egg plant brownie
//
//  Created by Rodrigo Amora on 01/08/22.
//

import UIKit

class Item: NSObject {
    
    let nome: String
    let calorias: Double
    
    init(nome: String, calorias: Double) {
        self.nome = nome
        self.calorias = calorias
    }
}
