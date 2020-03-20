//
//  AlimentoTableViewController.swift
//  calc2.0
//
//  Created by Dara Vasconcelos on 17/03/20.
//  Copyright © 2020 Dara Vasconcelos. All rights reserved.
//

import UIKit

class AlimentoTableViewController: UITableViewController {
    

    @IBOutlet weak var adicionaAlimento: UIBarButtonItem!
    
    //MARK:properties
    var alimento: Alimento?
    var alimentos = [Alimento]()

    override func viewDidLoad() {
        super.viewDidLoad()
        carregaExemplos()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        //mudar depois: cada dia é uma secao
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alimentos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "AlimentoTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? AlimentoTableViewCell else{
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        let alimento = alimentos[indexPath.row]
        cell.quantidadeTextField.text = String(alimento.quantidade)
        cell.nomeTextField.text = alimento.nome
        cell.unidadeTextField.text = alimento.unidade
        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: Private Methods
    
    private func carregaExemplos(){
         let alimento1 = Alimento(quantidade: 10, unidade: "g", nome: "feijao")
         let alimento2 = Alimento(quantidade: 20, unidade: "g", nome: "arroz")
         
        alimentos.append(alimento1)
        alimentos.append(alimento2)
    }

}
