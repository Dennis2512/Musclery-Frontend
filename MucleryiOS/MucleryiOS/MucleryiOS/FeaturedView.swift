//
//  FeaturedView.swift
//  MucleryiOS
//
//  Created by Arthur Siebert on 22.11.20.
//

import SwiftUI

struct FeaturedView: View {
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
            Rectangle()
                .frame(height: /*@START_MENU_TOKEN@*/85.0/*@END_MENU_TOKEN@*/)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .offset(y: -50)
                .overlay(
                    Text("Featured")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .offset(y: -30)
                )
            NavigationView{
                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                            .padding(.horizontal, 90.0)
                            .frame(height: 40.0)
                            .foregroundColor(.blue)
                            .overlay(
                                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                                    //Image(systemName: "gear").foregroundColor(.white)
                                    Text("Filter by Mucles").foregroundColor(.white)
                                })
                                
                            )
                    })
                    ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, content: {
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Corner Radius@*/25.0/*@END_MENU_TOKEN@*/)
                            .padding(.top, 8.0)
                            .padding(.horizontal, 15.0)
                            .frame(height: 220)
                            .foregroundColor(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                        .stroke()
                                        .foregroundColor(.blue)
                                        .padding(.top, 8)
                                        .padding(.horizontal, 15.0))
                            .overlay(
                                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                                    Image(systemName: "figure.walk")
                                        .opacity(0)
                                    Image(systemName: "figure.walk")
                                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                                    Text("Leg Press")
                                        .font(.title)
                                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                                        .padding(.bottom)
                                        .offset(x: -100)
                                    HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 40, content: {
                                        Text("Training Type:                                                            Sets:                                                                         Reps:                                                                      Muscle: ").multilineTextAlignment(.leading).lineLimit(4).offset(x: 30)
                                        Text("Strength          3               15                           Quadriceps").multilineTextAlignment(.trailing).lineLimit(4).frame(width: 90.0).offset(x: -40)
                                    })
                                        
                                    Spacer()

                                })
                            )
                            .shadow(radius: 10)
                    })
                })
                
                
            }
        })
        
        
    }
}

struct FeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedView()
    }
}
