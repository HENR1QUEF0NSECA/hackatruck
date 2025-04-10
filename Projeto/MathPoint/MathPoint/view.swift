//
//  view.swift
//  matchPoint
//
//  Created by Student12 on 22/08/23.
//

import Foundation

class ViewModel: ObservableObject{
    
    @Published var j : [jogos] = []
    
    func fetch(){
        guard let url = URL(string: "http://192.168.128.248:1880/matchPointGet") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url){
            [weak self] data, _, error in guard let data = data, error == nil else {
                return
            }
            
            do{
                let parsed = try JSONDecoder().decode([jogos].self , from: data)
                
                DispatchQueue.main.async{
                    self?.j = parsed
                }
            }catch{
                print(error)
            }
        }
        task.resume()
    }
}
