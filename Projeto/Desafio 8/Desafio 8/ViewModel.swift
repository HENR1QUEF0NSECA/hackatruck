//
//  ViewModel.swift
//  Desafio 8
//
//  Created by Student13 on 04/08/23.
//

import Foundation

class ViewModel: ObservableObject{
    
    @Published var chars: [Data] = []
    
    func fetch(){
        guard let url = URL(string: "https://valorant-api.com/v1/agents") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){[weak self] data, _,error in
            guard let data = data, error == nil else{
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode(Vava.self, from: data)
                
                DispatchQueue.main.async {
                    self?.chars = parsed.data!
                }
            }catch{
                print(error)
            }
        }
        
        task.resume()
    }
}
