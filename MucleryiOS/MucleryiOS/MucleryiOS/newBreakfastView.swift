//
//  newBreakfastView.swift
//  MucleryiOS
//
//  Created by Arthur Siebert on 18.11.20.
//

import SwiftUI

struct newBreakfastView: View {
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
                        .overlay(
                            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                                Image(systemName: "magnifyingglass")
                                    .padding(.leading, 30.0)
                                TextField("Name", text: self.$name)
                                        
                            })
                        
                        
                        )
                    NavigationLink(
                        destination: NewFoodView(),
                        label: {
                            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                                .padding(.bottom, -2.0)
                                .padding(.top, 2.0)
                                .foregroundColor(.blue)
                                .frame(width: 300.0, height: 37.0)
                                .overlay(HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                                    Text("Nahrungsmittel Hinzufuegen")
                                        .offset(y: 2)
                                        .foregroundColor(.white)
                                }))
                                .offset(y: 7)
                        })

                    
                    
                    
                }
            }
            
        
    }
}

struct newBreakfastView_Previews: PreviewProvider {
    static var previews: some View {
        newBreakfastView()
    }
}
