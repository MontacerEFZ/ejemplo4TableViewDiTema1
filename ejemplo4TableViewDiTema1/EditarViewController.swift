//
//  EditarViewController.swift
//  ejemplo4TableViewDiTema1
//
//  Created by Montacer El Fazazi on 09/11/2023.
//

import UIKit

class EditarViewController: UIViewController {

    @IBOutlet weak var txtTitulo: UITextField!
    @IBOutlet weak var txtContenido: UITextField!
    
    var tarea: Tarea!
    var delegate: ObtenerTareas!
    var posicion: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtTitulo.text = tarea.titulo
        txtContenido.text = tarea.contenido
    }
    

    @IBAction func btnEliminar(_ sender: Any) {
        delegate.eliminar(posicion: posicion)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnModificar(_ sender: Any) {
        if txtTitulo.text!.isEmpty || txtContenido.text!.isEmpty {
            let alert = UIAlertController(title: "error", message: "faltan datos", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .destructive, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        let nuevaTarea = Tarea(titulo: txtTitulo.text!, contenido: txtContenido.text!)
        delegate.modificar(posicion: posicion, dato: nuevaTarea)
        self.dismiss(animated: true, completion: nil)
    }
    
}
