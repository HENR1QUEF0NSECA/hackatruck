//
//  ContentView.swift
//  matchPoint
//
//  Created by Student12 on 18/08/23.
//

import SwiftUI

struct ContentView: View {
    init(){
        //UITabBar.appearance().backgroundColor = .orange
        //UITabBar.appearance().isTranslucent = false
//        UITabBar.appearance().isTranslucent = false
    }
    @StateObject var viewModel = ViewModel()
    @State private var searchText = "Todos"
    var user = usuarios(
        foto : "https://www.rbsdirect.com.br/filestore/6/9/7/8/7/9/3_a46aa14fe8c0551/3978796_2674920eb3b49de.jpg?w=700",
        nick : "Enzin",
        nome : "Tink Wink",
        sexo : "Masculino",
        idade : 6,
        descricao : "mt legal",
        avaliacao : 1.5,
        numAvaliacao : 102,
        numParticipacao : 136,
        interesses : ["Futebol", "Vôlei", "Tênis", "Ciclismo", "Basquete", "Handball", "Beachtenis"]
            )
    
    var searchResults: [jogos]{
        if searchText == "Todos"{
            return viewModel.j
        }
        else {
            return viewModel.j.filter{$0.modalidade.contains(searchText)}
        }
    }

    let modal = ["Todos", "Futebol", "Vôlei", "Tênis", "Ciclismo", "Basquete", "Handball", "Beachtenis"]
    @State var modalidades : String = ""
    
    func simbolo(nome: String) -> String{
        var imagem : String = "exclamationmark.triangle"
        
        if(nome=="Futebol"){
         imagem = "soccerball"
        }
        else if(nome=="Vôlei"){
            imagem = "volleyball"
        }
        else if(nome=="Ciclismo"){
            imagem = "bicycle"
        }
        else if(nome=="Basquete"){
            imagem = "basketball"
        }
        else if(nome=="Handball"){
            imagem =  "figure.handball"
        }
        else if(nome=="Tênis"){
            imagem =  "tennisball.fill"
        }
        else if(nome=="Beachtenis"){
            imagem =  "tennis.racket"
        }
        return imagem
    }
    
    
    var body: some View {
        NavigationStack{
            TabView{
                ScrollView{
                    Text("Home")
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Divider()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Picker("Modalidade", selection: $searchText){
                        ForEach(modal, id: \.self){
                            Text($0)
                        }
                    }
                    .frame(maxWidth: .infinity ,alignment: .trailing)
                    .foregroundColor(.black)

                    
                    ForEach(searchResults, id: \.self) { Jgo in
                        VStack{
                        
                            
                            HStack{
                                AsyncImage(url: URL(string: Jgo.foto)){
                                    image in image
                                        .resizable()
                                        .scaledToFill()
                                        .clipShape(Circle())
                                        .frame(width: 50, height: 50)
                                    
                                }placeholder: {
                                    ProgressView()
                                }
                                
                                Text(Jgo.usuario)
                                    .foregroundColor(.black)
                                    .font(.title)

                            }
                            Divider().padding(.horizontal)
                            Label(Jgo.modalidade, systemImage: simbolo(nome: Jgo.modalidade))
                                .foregroundColor(.black)
                            Text(Jgo.nivel)
                                .foregroundColor(.black)
                            Label(Jgo.local, systemImage: "map")
                                .foregroundColor(.black)
                            Label("\(Jgo.horario)   \(Jgo.data)", systemImage: "clock")
                                .foregroundColor(.black)
                            
                            Text("")
                            
                            NavigationLink(destination: jogo_info(aux: Jgo)){
                                Text("Abrir").bold()
                                    .foregroundColor(.white)
                                    .frame(width: 200)
                                    .background(.orange)
                                    .cornerRadius(5)
                            }
                            
                        }
                        .padding()
                            .frame(width: 325.0)
                            .background(.white)
                            .cornerRadius(10)
                            .shadow(radius:10, x:-5, y:5)
                            .padding()
                    }
                }
                .padding()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    } // Home
                
                ContentPublicacao(user: user)
                    .tabItem{
                        Label("Post", systemImage: "plus.app.fill")
                    }
                
                ContentProfile(usuario: user)
                    .tabItem{
                        Label("Profile", systemImage: "person.crop.circle")
                    }.opacity(1)
            }
        }.onAppear(){
            viewModel.fetch()
        }.preferredColorScheme(.light)
    }
}

struct jogo_info: View{
    @State var aux: jogos
    @State private var showingAlert = false
    @State var variavel = false

    var body: some View{
        NavigationStack{
            ScrollView{
                VStack{
                    AsyncImage(url: URL(string: aux.foto)){
                        image in image
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 100.0, height: 100.0)
                        
                    }placeholder: {
                        ProgressView()
                    }
                    
                    Text("@\(aux.usuario)")
                        .font(.title)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                    
                    
                    if((aux.descricao) != nil && (aux.descricao) != ""){
                        Text("\n\(aux.descricao!)\n")
                            .foregroundColor(.gray)
                            .frame(width: 300)
                            .background(.white)
                            .border(.gray)
                            .padding()
                    }
                    
                    
                    Label(aux.modalidade, systemImage: "soccerball").bold()
                        .font(.title)
                    
                    Label(aux.local, systemImage: "map")
                        .offset(y:10)
                    
                    HStack{
                        VStack{
                            Text("Nível \(aux.nivel)")
                            Text(aux.sexo)
                            Label("Vagas: \(String(aux.vagas))", systemImage: "person.fill")
                        }
                        Divider()
                        VStack{
                            Label(aux.data, systemImage: "calendar")
                            Label(aux.horario, systemImage: "clock")
                            
                            Text("preço: $\(String(aux.preco))")
                            
                        }
                    }.frame(width: 325.0)
                    
                        .padding()
                    
                    Button("Lista de participantes!"){
                        variavel.toggle()
                    }
                    .sheet(isPresented:$variavel){
                        //Text("participantes")
                        NavigationStack{
                            ForEach(aux.listaParticipantes, id: \.self){ i in
                                HStack{
                                    NavigationLink(destination: ContentProfile(usuario: i)){
                                        
                                        if((i.foto) != ""){
                                            AsyncImage(url: URL(string:i.foto)){
                                                image in image
                                                    .resizable()
                                                    .frame(width: 50, height: 50, alignment: .leading)
                                                    .scaledToFit()
                                                    .clipShape(Circle())
                                                    .padding(.horizontal)
                                            }placeholder: {
                                                ProgressView()
                                            }
                                            
                                            Text(i.nick).frame(maxWidth: .infinity, alignment: .leading)
                                                //.bold()
                                                .padding()
                                                .foregroundColor(.black)
                                        }
                                        else {
                                            Image(systemName: "person.circle")
                                                .resizable()
                                                .frame(width: 50, height: 50)
                                                .padding(.horizontal)
                                                .foregroundColor(.black)
                                            
                                            Text(i.nick).frame(maxWidth: .infinity, alignment: .leading)
                                                //.bold()
                                                .padding()
                                                .foregroundColor(.black)
                                        }
                                    }
                                }
                            }
                        }

                    }.onAppear(){
                        //aux.
                    }
                    
                    Button("Enviar solicitação") {
                        showingAlert = true
                        variavel.toggle()
                    }
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(.orange)
                    .cornerRadius(5)
                    .offset(y:20)
                    .alert("Solicitação enviada", isPresented: $showingAlert) {
                        Button("OK", role: .cancel) { }
                        Button("Desfazer"){
                            
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

