//
//  ViewController.swift
//  ejemplo4TableViewDiTema1
//
//  Created by Montacer El Fazazi on 02/11/2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ObtenerTareas {
    // a mano UITableViewDelegate, UITableViewDataSource, ObtenerTareas

    @IBOutlet weak var tablaTareas: UITableView!
    var listaTareas : [Tarea]!
    var tarea: Tarea!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listaTareas = []
        tablaTareas.delegate = self
        tablaTareas.dataSource = self
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //devuelve numeros de elementos q tiene la tabla
        listaTareas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { //devuelve la vista q hay q crear
        let celda = tableView.dequeueReusableCell(withIdentifier: "CELDA", for: indexPath) as! CeldaTableViewCell
        
        tarea = listaTareas[indexPath.row] //para coger indice de esa fila
        
        celda.lbTitulo.text = tarea.titulo
        celda.lbContenido.text = tarea.contenido
        
        return celda
    }
    
    func obtener(dato: Tarea) {
        tarea = dato
        listaTareas.append(dato)
        tablaTareas.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CREAR"{
            let destino = segue.destination as! CrearTareaViewController
            destino.delegate = self
        }
    }

}

