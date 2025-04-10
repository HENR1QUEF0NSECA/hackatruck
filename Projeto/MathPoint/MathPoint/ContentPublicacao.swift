//
//  ContentView.swift
//  MathP2
//
//  Created by Student11 on 22/08/23.
//

import SwiftUI

struct ContentPublicacao: View {
    //@State var id = 999
    let Mods = ["Selecione","Futebol", "Vôlei", "Ciclismo", "Basquete", "Handball", "Tênis", "Beachtenis"]
    let Nvl = ["Selecione","Iniciante", "Intermediário", "Avançado"]
    let Sex = ["Selecione","Feminino","Masculino", "Misto"]
    
    let listaParticipantes: [String] = []
    @State var user : usuarios
    @State var showingAlert = false
    
    @State var modalidade: String = ""
    @State var local: String = ""
    @State var descricao: String = ""
    @State var sexo: String = ""
    
    @State var horario: String = ""
    @State var horas: Int = 0
    @State var minutos: Int = 0
    
    @State var dataString: String = ""
    @State var data = Date()
    @State var nivel: String = ""
    
    @State var preco: Double = 0
    @State var precoString: String = ""
    
    @State var vagas: Int = 0
    @State var vagasString: String = ""
    
    @State var create_date = Date()
    @State var create_dateString: String = ""
    //@State var updated_date = Date()
    //@State var updated_dateString: String = ""
    
    @State var manager = DataPost()
    
    
    
    var body: some View {
        if manager.formCompleted {
            Text("Done").font(.headline)
        }
        NavigationView {
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color(.quaternarySystemFill), Color(.quaternarySystemFill)]),startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                ScrollView {
                    //Form {
                    VStack{
                        Text("Publicar").font(.largeTitle).frame(maxWidth: .infinity, alignment: .leading).bold()
                        Divider().overlay(.black).frame(height: 4).padding(.horizontal)
                        HStack{
                            Text("Modalidade:").frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)
                                .padding()
                            Picker("Modalidade", selection: $modalidade){
                                ForEach(Mods, id: \.self){
                                    Text($0)
                                }
                            }.frame(maxWidth: .infinity, alignment: .leading)
                                .accentColor(.orange)
                                .multilineTextAlignment(.leading)
                        }.frame(width: 350, height: 50)
                            .background(.white)
                            .cornerRadius(20)
                            .shadow(color: .gray,radius: 1,x:-1,y:1)
                        
                        HStack{
                            Text("Sexo:").frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)
                                .padding()
                            Picker("Sexo", selection: $sexo){
                                ForEach(Sex, id: \.self){
                                    Text($0)
                                }
                            }.frame(maxWidth: .infinity, alignment: .leading)
                                .accentColor(.orange)
                                .multilineTextAlignment(.leading)
                        }.frame(width: 350, height: 50)
                            .background(.white)
                            .cornerRadius(20)
                            .shadow(color: .gray,radius: 1,x:-1,y:1)
                        
                        HStack{
                            Text("Nível").frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)
                                .padding()
                            Picker("Nível", selection: $nivel){
                                ForEach(Nvl, id: \.self){
                                    Text($0)
                                }
                            }.frame(maxWidth: .infinity, alignment: .leading)
                                .accentColor(.orange)
                        }.frame(width: 350, height: 50)
                            .background(.white)
                            .cornerRadius(20)
                            .shadow(color: .gray,radius: 1,x:-1,y:1)
                    }.padding()
                    Rectangle()
                        .frame(width:350, height: 50)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .shadow(color: .gray,radius: 1,x:-1,y:1)
                        .overlay(HStack{
                            Text("Endereço: ").frame(alignment: .leading)
                                .multilineTextAlignment(.leading)
                            TextField("", text: $local).foregroundColor(.orange)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            
                        }.padding())
                    Rectangle()
                        .frame(width:350, height: 50)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .shadow(color: .gray,radius: 1,x:-1,y:1)
                        .overlay(HStack{
                            HStack{
                                Text("Vagas: ").frame(alignment: .leading)
                                    .multilineTextAlignment(.leading)
                                TextField("", value: $vagas,format: .number).foregroundColor(.orange)
                                    .keyboardType(.decimalPad)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                
                            }
                            Divider()
                            HStack{
                                Text("Preco: ").frame(alignment: .leading)
                                    .multilineTextAlignment(.leading)
                                TextField("", value: $preco, format: .number).foregroundColor(.orange)
                                    .keyboardType(.decimalPad)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                            }
                        }.padding())
                    
                    Rectangle()
                        .frame(width:350, height: 200)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .shadow(color: .gray,radius: 1,x:-1,y:1)
                        .overlay(VStack{
                            Text("Descriçao: ").frame(maxWidth: .infinity, alignment: .leading)
                                .bold()
                                .padding()
                            Divider().overlay(.orange).frame(height: 4).padding(.horizontal)
                            TextField("Escreva aqui...", text: $descricao, axis: .vertical).frame( alignment: .leading)
                                .foregroundColor(.orange)
                                .padding()
                            
                            Spacer()
                        })  .padding()
                    
                    
                    HStack{
                        Text("Data:").frame(alignment: .leading)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.leading)
                            .padding()
                        
                        DatePicker("", selection: $data, displayedComponents: .date)
                            .frame(width: 175, height: 50,alignment: .leading)
                            .padding()
                    }.frame(width: 350, height: 50)
                        .background(.white)
                        .cornerRadius(20)
                        .shadow(color: .gray,radius: 1,x:-1,y:1)
                    
                    Rectangle()
                        .frame(width:350, height: 200)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .shadow(color: .gray,radius: 1,x:-1,y:1)
                        .overlay(VStack{
                            Text("Horário")
                            Divider().overlay(.orange).frame(height: 4).padding(.horizontal)
                            HStack{
                                Picker("", selection: $horas){
                                    ForEach(0..<24, id: \.self){
                                        i in
                                        Text("\(i) horas").tag(i)
                                    }
                                }.pickerStyle(WheelPickerStyle())
                                    .frame(width: 150, height: 150)
                                Picker("", selection: $minutos){
                                    ForEach(0..<59, id: \.self){
                                        i in
                                        Text("\(i) minutos").tag(i)
                                    }
                                }.pickerStyle(WheelPickerStyle())
                                    .frame(width: 150, height: 150)
                            }
                        })  .padding()
                    
                    
                    Section(){
                        Button(action: {
                            let dateFormatter = DateFormatter()
                            dateFormatter.dateStyle = .short
                            
                            dataString = dateFormatter.string(from: data)
                            horario = arrumaHora(horas: horas, minutos: minutos)
                            showingAlert = true
                            print("Clicked")
                            
                            
                            self.manager.checkDetails(usuario: self.user.nick, foto: self.user.foto, modalidade: self.modalidade, local: self.local, descricao: self.descricao, sexo: self.sexo, horario: self.horario, data: self.dataString, nivel: self.nivel, preco: self.preco, vagas: self.vagas)
                        }, label: {
                            
                            
                            Text("Criar Evento")
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                                .foregroundColor({
                                    if(!local.isEmpty && vagas>0 && !(modalidade=="Selecione" || nivel=="Selecione" || sexo=="Selecione" )){
                                        return .orange
                                    }else{
                                        return .gray
                                    }
                                }())
                        })
                        .padding()
                    }.disabled(local.isEmpty || modalidade=="Selecione" || nivel=="Selecione" || sexo=="Selecione" )
                        .alert("Publicação enviada", isPresented: $showingAlert) {
                            Button("OK", role: .cancel) { }
                        }
                }
            }.foregroundColor(.black)
        }
        
    }
    
    func arrumaHora(horas: Int, minutos: Int)-> String{
        var horaFormatada : String = ""
        var minutoFormatado : String = ""
        if(horas<10){
            horaFormatada = "0\(horas)"
        }
        else{horaFormatada="\(horas)"}
        if(minutos<10){
            minutoFormatado = "0\(minutos)"
        }
        else{minutoFormatado = "\(minutos)"}
        return horaFormatada + ":" + minutoFormatado
    }
}
