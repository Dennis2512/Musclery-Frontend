//
//  NotesView.swift
//  MucleryiOS
//
//  Created by Arthur Siebert on 18.11.20.
//

import SwiftUI

struct NotesView: View {
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                    //Placeholder
                    Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                        Rectangle()
                            .foregroundColor(.white)
                            .padding(.horizontal, 0.0)
                            .border(Color.gray, width: 0.5)
                            .frame(height: 50.0)
                            .overlay(Text("Training vergessen :(").foregroundColor(.black).offset(x: -100))
                            
                    }
                    .padding(.bottom, -9.0)
                    .padding(.top, 0.0)
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                            .padding(.horizontal)
                            .frame(height: 40.0)
                            .foregroundColor(.blue)
                            .overlay(
                                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                                    Image(systemName: "doc.fill.badge.plus").foregroundColor(.white)
                                    Text("Notizen").foregroundColor(.white)
                                })
                            )
                    })
                    .padding(.horizontal, 60.0)
                    .frame(height: 20.0)
                    .offset(y: 20)
                })
            }
            .offset(y: -100)
        }
        
    }
}

struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        NotesView()
    }
}
