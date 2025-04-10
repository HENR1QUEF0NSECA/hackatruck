//
//  ContentView.swift
//  AulaDois-1
//
//  Created by Student13 on 28/07/23.
//

import SwiftUI

struct ContentView: View {
    @State var peso = ""
    @State var altura = ""
    
    @State var pesoReal :Float = 0.0
    @State var alturaReal :Float = 0.0
    
    @State var resultado :Float = 0.0
    @State var cor = ""
    
    func calculaIMC( x: Float, y:Float)-> Float{
        var z :Float = 0.0
        z = x/(y*y)
        return z
    }
    
    var body: some View {
        ZStack{
            Color(cor).ignoresSafeArea()
            VStack {                Text("Calculadora de IMC")
                    .font(.largeTitle)
                    .bold()
                    .fontDesign(.rounded)
                
                TextField("Digite seu peso", text: $peso)
                    .keyboardType(.decimalPad)
                    .textContentType(.oneTimeCode)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .frame(width: 350)
                
                TextField("Digite sua altura", text: $altura)
                    .keyboardType(.decimalPad)
                    .textContentType(.oneTimeCode)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .frame(width: 350)
                    
                
                Button ("calcular"){
                    pesoReal = Float(peso) ?? 0.0
                    alturaReal = Float(altura) ?? 0.0
                    
                    resultado = calculaIMC(x: pesoReal, y: alturaReal)
                    
                    if resultado < 18.5{
                        cor = "baixo"
                    }
                    else if resultado < 24.99 && resultado >= 18.5{
                        cor = "normal"
                    }
                    else if resultado < 29.99 && resultado >= 25.0{
                        cor = "sobrepeso"
                    }
                    else if resultado > 30.0{
                        cor = "obesidade"
                    }
                }
                .frame(width: 100.0,height: 40.0)
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(5)
                .offset(y:25)
                
                Spacer()
                
                Image("tabela")
                    .resizable()
                    .scaledToFit()
                    .ignoresSafeArea()
                    .frame(width: 450,height: 200)
                #imageLiteral(resourceName: "simulator_screenshot_DC5E2B0C-B75B-4E8C-92A9-A965C15A9F41.png")
                
            }
            Text("\(cor)")
                .font(.largeTitle)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
