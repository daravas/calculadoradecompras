//
//  Alimento.swift
//  calc2.0
//
//  Created by Dara Vasconcelos on 17/03/20.
//  Copyright © 2020 Dara Vasconcelos. All rights reserved.
//

import UIKit

class Alimento{
    
    //MARK: properties
    
    var quantidade: Float
    var unidade: String
    var nome: String
    
    //MARK: initialization
    
    init(quantidade: Float, unidade: String, nome: String) {
        self.quantidade = quantidade;
        self.unidade = unidade
        self.nome = nome
        
    }
    
    init() {
        self.quantidade = 0;
        self.unidade = ""
        self.nome = ""
    }
    
    
}
