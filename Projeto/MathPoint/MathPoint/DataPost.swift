//
//  DataPost.swift
//  MathP2
//
//  Created by Student11 on 22/08/23.
//

import Foundation
import Combine


class DataPost: ObservableObject {
    var didChange = PassthroughSubject<DataPost, Never>()
    var formCompleted = false {
        didSet {
            didChange.send(self)
        }
    }
    
    func checkDetails(usuario: String, foto: String, modalidade: String, local: String, descricao: String?, sexo: String, horario: String, data: String, nivel: String, preco: Double, vagas: Int) {
            
            
            
        let body: [String: Any] = ["data": ["usuario": usuario,"foto": foto, "modalidade": modalidade, "local": local, "descricao": descricao!, "sexo": sexo, "horario": horario, "data": data, "nivel": nivel, "preco": preco, "vagas": vagas, "listaParticipantes": []]]
                    
            let jsonData = try? JSONSerialization.data(withJSONObject: body)
                    
            let url = URL(string: "http://192.168.128.248:1880/matchPointPost")!
            var request = URLRequest(url: url)
            
            request.httpMethod = "POST"
            
            request.setValue("\(String(describing: jsonData?.count))", forHTTPHeaderField: "Content-Length")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            request.httpBody = jsonData
            
            
            print(body)
            print(jsonData!)
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {
                    print(error?.localizedDescription ?? "No data")
                    return
                }

                let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
                if let responseJSON = responseJSON as? [String: Any] {
                    print(responseJSON)
                }
            }

            task.resume()
        }
}
