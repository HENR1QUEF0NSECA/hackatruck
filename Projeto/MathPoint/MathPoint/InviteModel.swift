//
//  InviteModel.swift
//  TesteApp
//
//  Created by StudentBackup01 on 23/08/23.
//

import Foundation

class  ViewInvite: ObservableObject {
    
    @Published var solicitacao: [solicitacoes] = []
    
    func fetch(){
        guard let url = URL(string: "http://192.168.128.248:1880/matchPointinviteGet") else{
            return
        }
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let parsed = try JSONDecoder().decode([solicitacoes].self, from: data)
                
                DispatchQueue.main.async {
                    self?.solicitacao = parsed
                }
            } catch{
                print(error)
            }
        }
        task.resume()
    }
}
