
import Foundation

class ViewModel: ObservableObject{
    
    @Published var estacionamentos: [estacionamento] = []
    
    func fetch(){
        guard let url = URL(string: "http://127.0.0.1:1880/henriquefonseca") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){[weak self] data, _,error in
            guard let data = data, error == nil else{
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([estacionamento].self, from: data)
                
                DispatchQueue.main.async {
                    self?.estacionamentos = parsed
                }
            }catch{
                print(error)
            }
        }
        
        task.resume()
    }
}

