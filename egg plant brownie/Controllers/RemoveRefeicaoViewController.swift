//
//  RemoveRefeicaoViewController.swift
//  egg plant brownie
//
//  Created by Rodrigo Amora on 30/08/22.
//

import Foundation
import UIKit

class RemoveRefeicaoViewController {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func exibe(_ refeicao: Refeicao, handler: @escaping (UIAlertAction) -> Void) {
        let alert = UIAlertController(title: refeicao.nome,
                                      message: refeicao.detalhes(),
                                      preferredStyle: .alert)
        
        let botaoCancelar = UIAlertAction(title: "OK", style: .cancel)
        let botaoRemover = UIAlertAction(title: "Remover", style: .destructive, handler: handler)
        
        alert.addAction(botaoCancelar)
        alert.addAction(botaoRemover)
        
        controller.present(alert, animated: true, completion: nil)
    }
}
