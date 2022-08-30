//
//  Alerta.swift
//  egg plant brownie
//
//  Created by Rodrigo Amora on 30/08/22.
//

import Foundation
import UIKit

class Alerta {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func exibe() {
        let okButton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        let alerta = UIAlertController(title: "Desculpe", message: "não foi possível atualizar a tabela", preferredStyle: .alert)
        alerta.addAction(okButton)
        controller.present(alerta, animated: true, completion: nil)
    }
}
