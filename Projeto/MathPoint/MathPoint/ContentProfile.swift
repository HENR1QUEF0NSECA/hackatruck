//
//  ContentView.swift
//  MatchP
//
//  Created by Student11 on 18/08/23.
//

import SwiftUI

struct ContentProfile: View {
    // @StateObject var viewUser = ViewUser()
    @State var usuario : usuarios
    @State var countInvite : Int = 3
    @StateObject var solicit = ViewInvite()
    @State var solicitFiltrado: [solicitacoes] = []
    @State var showSol : Bool = false
    //@State var solicitFiltrado : [solicitacoes] // TEM QUE FILTRAR AS SOLICITACOS ??
    //    init() {
    //            //Use this if NavigationBarTitle is with Large Font
    //            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.black]
    //
    //            //Use this if NavigationBarTitle is with displayMode = .inline
    //            //UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    //
    ////        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
    ////        UINavigationBar.appearance().shadowImage = UIImage()
    ////        UINavigationBar.appearance().isTranslucent = true
    //
    //    }
    
    
    
    var body: some View {
        NavigationStack{
            ZStack{
                //                Color(.quaternarySystemFill)
                //                    .ignoresSafeArea()
                LinearGradient(gradient: Gradient(colors: [.orange, Color(.quaternarySystemFill)]),startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                ScrollView{
                    VStack {
                        Text("Perfil").font(.largeTitle)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .padding()
                            .bold()
                        Divider().overlay(.black).padding(.horizontal)
                        Circle().frame(width: 160, height: 160)
                            .foregroundColor(.white)
                            .overlay(VStack{
                                AsyncImage(url: URL(string:usuario.foto)){
                                    image in image
                                        .resizable()
                                        .frame(width: 150, height: 150)
                                        .scaledToFit()
                                        .clipShape(Circle())
                                }placeholder: {
                                    ProgressView()
                                }
                            })
                        Text(usuario.nick + "\n" + usuario.nome).font(.largeTitle)
                            .bold()
                        //Text(usuario.nome).foregroundColor(.black)
                        HStack{
                            Rectangle()
                                .frame(width: 160,height: 50)
                                .foregroundColor(.white)
                                .cornerRadius(20)
                                .shadow(color: .gray,radius: 1,x:-1,y:1)
                                .overlay(VStack{
                                    Text("Sexo: \(usuario.sexo)").frame(maxWidth: .infinity, alignment: .leading)
                                    
                                        .padding()
                                })
                                .padding()
                                .padding(.horizontal)
                            Rectangle()
                                .frame(width:110, height: 50)
                                .foregroundColor(.white)
                                .cornerRadius(20)
                                .shadow(color: .gray,radius: 1,x:-1,y:1)
                                .overlay(VStack{
                                    Text("Idade: \(usuario.idade)").frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.horizontal)
                                })
                        
                            
                            Spacer()
                        }
                        Rectangle()
                            .frame(width:350, height: 200)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            .shadow(color: .gray,radius: 1,x:-1,y:1)
                            .overlay(VStack{
                                Text("Descriçao: ").frame(maxWidth: .infinity, alignment: .leading)
                                    .bold()
                                    .padding()
                                Divider()
                                Text(usuario.descricao!).frame(maxWidth: .infinity, alignment: .leading)
                                    .padding()
                                Spacer()
                            })
                        
                        Text("Interesses: ").frame(maxWidth: .infinity, alignment: .leading)
                            .bold()
                            .padding()
                        ScrollView(.horizontal){
                            HStack{
                                ForEach(usuario.interesses, id: \.self){ i in
                                    Image(systemName: ContentView().simbolo(nome:i)).resizable().frame(width:50, height: 50).padding()
                                }
                            }
                        }
                        
                        //Spacer()
                        if(usuario.nick == ContentView().user.nick){
                            ZStack{
                                
                                Button("Solicitações"){
                                    showSol.toggle()
                                    solicitFiltrado = solicit.solicitacao.filter{$0.usuario.contains(usuario.nick)}
                                }.foregroundColor(.white)
                                    .padding()
                                    .frame(width: 180, height: 50,alignment: .trailing)
                                    .background(.orange)
                                    .cornerRadius(20)
                                    .shadow(color: .gray,radius: 1,x:-1,y:1)
                                    .sheet(isPresented: $showSol){
                                        NavigationStack{
                                            VStack{
                                                if(solicitFiltrado.count == 0){
                                                    Text("Nenhuma Solicitação").font(.largeTitle).foregroundColor(.gray)
                                                }
                                                else{
                                                    ForEach(solicitFiltrado, id: \.self){ i in
                                                        NavigationLink(destination: ContentProfile(usuario: i.remetente)){
                                                            HStack{
                                                                AsyncImage(url: URL(string:i.remetente.foto)){
                                                                    image in image
                                                                        .resizable()
                                                                        .frame(width: 50, height: 50)
                                                                        .scaledToFit()
                                                                        .clipShape(Circle())
                                                                        .padding()
                                                                }placeholder: {
                                                                    ProgressView()
                                                                }
                                                                Text(i.remetente.nick).frame(maxWidth: .infinity, alignment: .leading)
                                                                    .padding()
                                                                    .foregroundColor(.black)
                                                            }
                                                            
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    .overlay(HStack(alignment: .top) {
                                        if(solicitFiltrado.count < 0){
                                            Image(systemName: "\(solicitFiltrado.count)")
                                                .resizable()
                                                .renderingMode(.template)
                                                .foregroundColor(.red)
                                                .frame(width: 25,height: 25)
                                                .offset(x:35,y: -25)
                                        }
                                    }.frame(maxHeight: .infinity)
                                        .symbolVariant(.fill)
                                        .symbolVariant(.circle)
                                        .offset(x:50)
                                    )
                                    Image(systemName: "person.fill.questionmark")
                                        .resizable()
                                        .frame(width: 35,height: 30)
                                        .foregroundColor(.white)
                                        .offset(x:-50)
                                }
                            }
                        }
                        
                        
                        Rectangle()
                            .frame(width:350, height: 130)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            .shadow(color: .gray,radius: 1,x:-1,y:1)
                            .overlay(VStack{
                                Text("Avaliações: \(usuario.numAvaliacao)")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .bold()
                                    .padding()
                                Divider()
                                HStack{
                                    Text("Participações: \(usuario.numParticipacao)")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .multilineTextAlignment(.leading)
                                    
                                    Divider()
                                        .overlay(.gray)
                                    ForEach(imageRating(num: usuario.avaliacao), id: \.self){
                                        star in
                                        HStack{
                                            Image(systemName: star).resizable()
                                                .frame(width: 25,height: 25)
                                                .foregroundColor(.orange)
                                        }
                                    }
                                    
                                }.padding()
                            }
                            )
                        
                            .padding()
                    }
                }
                
            }.onAppear(){
                solicit.fetch()
            }
            //.foregroundColor(.black)
            //.background(Color.black)
        }
    }
    
    func imageRating(num : Double) -> [String]{
        var r : [String] = []
        switch(num){
        case 0..<0.5:
            for _ in 1...3{
                r.append("star")
            }
            break
        case 0.5..<1:
            r.append("star.leadinghalf.filled")
            for _ in 1...2{
                r.append("star")
            }
            break
        case 1..<1.5:
            r.append("star.fill")
            for _ in 1...2{
                r.append("star")
            }
            break
        case 1.5..<2:
            r.append("star.fill")
            r.append("star.leadinghalf.filled")
            r.append("star")
            break
        case 2..<2.5:
            for _ in 1...2{
                r.append("star.fill")
            }
            r.append("star")
            break
        case 2.5..<3:
            for _ in 1...2{
                r.append("star.fill")
            }
            r.append("star.leadinghalf.filled")
            break
        case 3:
            for _ in 1...3{
                r.append("star.fill")
            }
            break
        default:
            r.append("questionmark")
            break
        }
        return r
    }
    
    struct ContentProfile_Previews: PreviewProvider {
     static var previews: some View {
         ContentProfile(usuario: ContentView().user)
     }
     }
     
