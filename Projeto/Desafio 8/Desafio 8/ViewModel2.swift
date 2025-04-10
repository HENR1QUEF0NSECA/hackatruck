//
//  ViewModel2.swift
//  Desafio 8
//
//  Created by Student13 on 09/08/23.
//

import Foundation

class ViewModel2: ObservableObject{
    
    @Published var guns: [DataGuns] = []
    
    func fetch(){
        guard let url = URL(string: "https://valorant-api.com/v1/weapons") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){[weak self] data, _,error in
            guard let data = data, error == nil else{
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode(VavaGuns.self, from: data)
                
                DispatchQueue.main.async {
                    self?.guns = parsed.data!
                }
            }catch{
                print(error)
            }
        }
        
        task.resume()
    }
}
