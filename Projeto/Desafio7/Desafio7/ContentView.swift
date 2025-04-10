//
//  ContentView.swift
//  Desafio7
//
//  Created by Student13 on 03/08/23.
//23.406951,

import SwiftUI
import MapKit

var locations = [
    location(name: "Brasil", cordinate: CLLocationCoordinate2D(latitude: -14.2400732, longitude: -53.1805017), description: "O Brasil, um vasto país sul-americano, estende-se da Bacia Amazônica, no norte, até os vinhedos e as gigantescas Cataratas do Iguaçu, no sul. O Rio de Janeiro, simbolizado pela sua estátua de 38 metros de altura do Cristo Redentor, situada no topo do Corcovado, é famoso pelas movimentadas praias de Copacabana e Ipanema, bem como pelo imenso e animado Carnaval, com desfiles de carros alegóricos, fantasias extravagantes e samba.", bandeira: "https://s1.static.brasilescola.uol.com.br/be/conteudo/images/2-bandeira-do-brasil.jpg"),
    location(name: "Alemanha", cordinate: CLLocationCoordinate2D(latitude: 50, longitude: 10), description: "A Alemanha é um país situado na Europa Ocidental com uma paisagem de florestas, rios, cordilheiras e praias do Mar do Norte. A nação tem mais de 2 milênios de história. Berlim, a capital, abriga cenários artísticos e de vida noturna, o Portão de Brandemburgo e muitos locais relacionados à Segunda Guerra Mundial. Munique é conhecida pela Oktoberfest e pelos beer halls, entre eles o Hofbräuhaus, do século XVI. Frankfurt, com seus arranha-céus, abriga o Banco Central Europeu.", bandeira: "https://static.significados.com.br/foto/alemanha.jpg"),
    location(name: "Nigeria", cordinate: CLLocationCoordinate2D(latitude: 9, longitude: 8), description: "A Nigéria, um país africano que fica no Golfo da Guiné, tem muitos monumentos naturais e reservas de animais selvagens. Áreas protegidas como o Parque Nacional do Rio Cross e o Parque Nacional Yankari têm cachoeiras, densas florestas, savanas e habitats de primatas raros. Um dos locais mais conhecidos é a Zuma Rock, um monólito de 725 metros de altura que fica perto da capital Abuja e é retratado na moeda nacional.", bandeira: "https://s5.static.brasilescola.uol.com.br/be/2021/04/bandeira-da-nigeria.jpg"),
    location(name: "Mexico", cordinate: CLLocationCoordinate2D(latitude: 23.406951, longitude: -102.418741), description: "O México é um país situado entre os Estados Unidos e a América Central, conhecido pelas praias no Pacífico e no Golfo do México e pela paisagem diversificada que inclui montanhas, desertos e selvas. Ruínas antigas, como Teotihuacán e a cidade maia de Chichén Itzá, estão espalhadas pelo país, assim como cidades da era colonial espanhola. Na capital, Cidade do México, lojas elegantes, museus renomados e restaurantes gourmet atendem às necessidades da vida moderna.",bandeira: "https://img.elo7.com.br/product/original/44E0736/bandeira-da-mexico-tamanho-oficial-0-90x1-28m-766191-bandeira-futebol.jpg")
    
    ]

struct ContentView: View {
    @State var num = 0
    //
    @State var sheetBool = false
    //
    @State var localName = " "
    //
    @State var popLocation: location = locations[0]
    
    
    @State private var region =
    MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 0, longitude: 0), span:  MKCoordinateSpan(latitudeDelta: 100, longitudeDelta: 100))
    
    var body: some View {
        
        VStack {
            Text("WorldMap")
                .bold()
                .font(.title)
            Text("\(localName)")
            
            Map(coordinateRegion: $region, annotationItems: locations) { location in
                MapAnnotation(coordinate: location.cordinate){
                    Circle()
                        .frame(width: 10,height: 10)
                        .foregroundColor(.red)
                        .onTapGesture {
                            popLocation = location
                            sheetBool.toggle()
                        }
                        .sheet(isPresented: $sheetBool){
                            SheetView(popLocation: $popLocation, isPresented: $sheetBool)
                        }
                        
                }
                    
                    
            }
            .ignoresSafeArea()
            
            HStack{
                ForEach(locations) { location in
                    Button("\(location.name)"){
                        region = MKCoordinateRegion(center: location.cordinate, span:  MKCoordinateSpan(latitudeDelta: 20, longitudeDelta: 20))
                        
                        localName = location.name
                    }
                    .frame(width: 90,height: 50)
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(5)
                    
                    
                }
            }
            Spacer()
        }
                
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
