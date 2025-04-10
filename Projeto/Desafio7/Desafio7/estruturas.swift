//
//  estruturas.swift
//  Desafio7
//
//  Created by Student13 on 03/08/23.
//

import Foundation
import MapKit

struct location: Identifiable{
    let id = UUID()
    let name: String
    let cordinate: CLLocationCoordinate2D
    let description: String
    let bandeira: String
}
