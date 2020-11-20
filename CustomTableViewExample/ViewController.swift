//
//  ViewController.swift
//  CustomTableViewExample
//
//  Created by marco alonso on 19/11/20.
//

import UIKit

var notas = [String]()

let defaults = UserDefaults.standard

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = Tabla.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AlumnoTableViewCell
        celda.notaLabel.text = notas[indexPath.row]
        return celda
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(notas[indexPath.row])
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            notas.remove(at: indexPath.row)
        }
        
        defaults.setValue(notas, forKey: "notas")
        
        Tabla.reloadData()
    }
    

    @IBOutlet weak var Tabla: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Tabla.register(UINib(nibName: "AlumnoTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        if let notasGuardadas = defaults.array(forKey: "notas") as? [String] {
            notas = notasGuardadas
        }
        // Do any additional setup after loading the view.
    }

    @IBAction func addNota(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alerta = UIAlertController(title: "Nueva Nota", message: "Agregar", preferredStyle: .alert)
        
        alerta.addTextField { (alertTextField) in
            alertTextField.placeholder = "Escribe nombre de la nota"
            print(alertTextField.text!)
            textField = alertTextField
        }
        
        let actionOk = UIAlertAction(title: "Aceptar", style: .default) { (_) in
            notas.append(textField.text!)
            defaults.setValue(notas, forKey: "notas")
            self.Tabla.reloadData()
        }
        
        alerta.addAction(actionOk)
        
        present(alerta, animated: true, completion: nil)
    }
    
}

