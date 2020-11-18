//
//  NewFoodView.swift
//  MucleryiOS
//
//  Created by Arthur Siebert on 18.11.20.
//

import SwiftUI

struct NewFoodView: View {
    @State var name = ""
    @State var description = ""
    @State var kcal = ""
    @State var kohlenhydrate = ""
    @State var proteins = ""
    @State var fats = ""
    var body: some View {
        NavigationView{
            ScrollView{
                //name
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .padding(.horizontal)
                    .foregroundColor(.white)
                    .frame(height: 50.0)
                    .overlay(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                .stroke()
                                .foregroundColor(.blue)
                                .padding(.horizontal)
                                .padding(.top, 0))
                    .overlay(TextField("Name", text: self.$name)
                                .padding(.leading, 30.0))
                //beschreibung
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .padding(.horizontal)
                    .foregroundColor(.white)
                    .frame(height: 50.0)
                    .overlay(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                .stroke()
                                .foregroundColor(.blue)
                                .padding(.horizontal)
                                .padding(.top, 0))
                    .overlay(TextField("Beschreibung", text: self.$description)
                                .padding(.leading, 30.0))
                //Naehrwerte auf 100g
                Text("Nährwerte auf 100g:")
                    .padding(.vertical, 10.0)
                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 0, content: {
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .padding(.horizontal)
                        .foregroundColor(.white)
                        .frame(height: 50.0)
                        .overlay(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                    .stroke()
                                    .foregroundColor(.blue)
                                    .padding(.horizontal)
                                    .padding(.top, 0))
                        .overlay(TextField("kcal", text: self.$kcal)
                                    .padding(.leading, 30.0))
                    //
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .padding(.horizontal)
                        .foregroundColor(.white)
                        .frame(height: 50.0)
                        .overlay(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                    .stroke()
                                    .foregroundColor(.blue)
                                    .padding(.horizontal)
                                    .padding(.top, 0))
                        .overlay(TextField("Kohlenhydrate", text: self.$kohlenhydrate)
                                    .padding(.leading, 30.0))
                })
                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 0, content: {
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .padding(.horizontal)
                        .foregroundColor(.white)
                        .frame(height: 50.0)
                        .overlay(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                    .stroke()
                                    .foregroundColor(.blue)
                                    .padding(.horizontal)
                                    .padding(.top, 0))
                        .overlay(TextField("Proteine", text: self.$proteins)
                                    .padding(.leading, 30.0))
                    //
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .padding(.horizontal)
                        .foregroundColor(.white)
                        .frame(height: 50.0)
                        .overlay(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                    .stroke()
                                    .foregroundColor(.blue)
                                    .padding(.horizontal)
                                    .padding(.top, 0))
                        .overlay(TextField("Fette", text: self.$fats)
                                    .padding(.leading, 30.0))
                    
                })
                .padding(.top, 5.0)
                //Kategorien
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                        .padding(.horizontal)
                        .frame(height: 40.0)
                        .foregroundColor(.blue)
                        .overlay(
                            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                                Text("Hinzufügen").foregroundColor(.white)
                            })
                        )
                        .padding(.top, 10.0)
                })
                
                
                
            }
        }
    }
}

struct NewFoodView_Previews: PreviewProvider {
    static var previews: some View {
        NewFoodView()
    }
}
