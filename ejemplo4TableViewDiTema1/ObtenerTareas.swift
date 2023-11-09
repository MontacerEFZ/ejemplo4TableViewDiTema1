//
//  ObtenerTareas.swift
//  ejemplo4TableViewDiTema1
//
//  Created by Montacer El Fazazi on 02/11/2023.
//

import Foundation

protocol ObtenerTareas {
    func obtener(dato: Tarea)
    func eliminar(posicion: Int)
    func modificar(posicion: Int, dato: Tarea)
}
