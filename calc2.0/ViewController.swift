//
//  ViewController.swift
//  calc2.0
//
//  Created by Dara Vasconcelos on 17/03/20.
//  Copyright © 2020 Dara Vasconcelos. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let diasFeira: [String] = ["7 dias","15 dias","30 dias"]
    @IBOutlet weak var diasFeiraPickerView: UIPickerView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var listaDeComprasView: UIView!
    @IBOutlet weak var listaDeComprasTextView: UITextView!
    @IBOutlet weak var cardapioLabel: UILabel!
    @IBOutlet weak var adicionaButton: UIButton!
    @IBOutlet weak var gerarListaButton: UIButton!
    @IBOutlet weak var frequenciaDaFeiraLabel: UILabel!
    
    
    
    
   
    
    var countTableView = 1
    var alimentos: [Alimento] = []
    var listaDeCompras:[Alimento] = []
    
    @IBAction func gerarLista(_ sender: Any) {
        listaDeCompras = []
        guardaInfos()
        //imprimeAlimentos()
        calculaFeira()
        imprimeLista()
        mostraView()
        imprimeAlimentos()
        
    }
    
    @IBAction func listaDeComprasOkButton(_ sender: Any) {
           escondeView()
           mostraElementos()
        listaDeCompras = []
           
       }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        escondeView()
        //fechar teclado quando tocar na tela
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        diasFeiraPickerView.delegate = self
        diasFeiraPickerView.dataSource = self
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return diasFeira.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return diasFeira[row]
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countTableView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlimentoTableViewCell", for: indexPath) as! AlimentoTableViewCell
        return cell
    }
    
    
    
    @IBAction func addCell() {
        insereTableViewCell()
    }
    
    
    func insereTableViewCell() {
        let indexPath = IndexPath(row:countTableView, section: 0)
        countTableView += 1
        tableView.beginUpdates()
        tableView.insertRows(at: [indexPath], with: .bottom)
        tableView.endUpdates()
        tableView.reloadData()
    }
    
    func escondeElementos() {
        tableView.isHidden = true
        cardapioLabel.isHidden = true
        adicionaButton.isHidden = true
        gerarListaButton.isHidden = true
        diasFeiraPickerView.isHidden = true
        frequenciaDaFeiraLabel.isHidden = true
    }
    
    func mostraElementos(){
        tableView.isHidden = false
        cardapioLabel.isHidden = false
        adicionaButton.isHidden = false
        gerarListaButton.isHidden = false
        diasFeiraPickerView.isHidden = false
        frequenciaDaFeiraLabel.isHidden = false
    }
    
    func escondeView(){
        listaDeComprasView.isHidden = true
    }
    func mostraView(){
        escondeElementos()
        listaDeComprasView.isHidden = false
    }
    
    
    func guardaInfos() {
        var aux = 1
        
        while aux <= countTableView {
            var alimento = Alimento()
            
            let indexPath = IndexPath(row:(countTableView-aux) , section: 0)
            let cell:AlimentoTableViewCell = tableView.cellForRow(at: indexPath)as! AlimentoTableViewCell
            
            alimento.nome = cell.nomeTextField.text!
            alimento.quantidade = Float(cell.quantidadeTextField.text!)!
            alimento.unidade = cell.unidadeTextField.text!
            
            alimentos.append(alimento)
            
            limpaCampos(cell:cell)
            
            aux = aux + 1
        }
        
    }
    
    func limpaCampos(cell:AlimentoTableViewCell) {
        cell.quantidadeTextField.text = ""
        cell.unidadeTextField.text = ""
        cell.nomeTextField.text = ""
    }
    
    func imprimeAlimentos() {
        for alimento in alimentos{
            var linha: String = ""
            linha = String(alimento.quantidade) + " " + alimento.unidade + " " + alimento.nome + "\n\n"
            listaDeComprasTextView.text = listaDeComprasTextView.text + linha
        }
        print("\n")
    }
    
    func calculaFeira()  {
        let linhaSelecionada: Int = diasFeiraPickerView.selectedRow(inComponent: 0)
        //let porteSelecionado = portes[linhaSelecionada]
        if linhaSelecionada == 0 {
            listaDeCompras = calcula7(alimentos: alimentos)
        }else if linhaSelecionada == 1{
            listaDeCompras = calcula15(alimentos: alimentos)
        }else{
            listaDeCompras = calcula30(alimentos: alimentos)
        }
        
    }
    
    func calcula7(alimentos:[Alimento]) -> [Alimento] {
        for alimento in alimentos{
            alimento.quantidade = alimento.quantidade * 7
        }
        return alimentos
    }
    
    func calcula15(alimentos:[Alimento]) -> [Alimento] {
        for alimento in alimentos{
            alimento.quantidade = alimento.quantidade * 15
        }
        return alimentos
    }
    
    func calcula30(alimentos:[Alimento]) -> [Alimento] {
        for alimento in alimentos{
            alimento.quantidade = alimento.quantidade * 30
        }
        return alimentos
    }
    
    func imprimeLista() {
        for alimento in listaDeCompras{
            print(alimento.nome)
            print(alimento.quantidade)
            
        }
        print("\n")
    }
    //    func imprimeLista(listaDeCompras: [Alimento]){
    //        for alimentos in listaDeCompras{
    //            print(alimentos.nome)
    //            print(alimentos.quantidade)
    //            print("\n")
    //        }
    //    }
    //
    //    func calculaLista() -> [Alimento] {
    //        var listaDeCompras : [Alimento] = []
    //        var alimentoAux = Alimento()
    //        var aux = 1
    //
    //        for alimento in alimentos{
    //            aux = 1
    //
    //            while aux < alimentos.count {
    //                if alimento.nome == alimentos[aux].nome {
    //
    //                    alimentoAux.nome = alimento.nome
    //                    alimentoAux.quantidade = alimento.quantidade + alimentos[aux].quantidade
    //                    alimentoAux.unidade = alimento.unidade
    //
    //                    alimentos.remove(at: aux)
    //                }
    //                aux = aux + 1
    //            }
    //
    //        }
    //        listaDeCompras.append(alimentoAux)
    //
    //
    //
    //        return listaDeCompras
    //    }
    //
    
}

