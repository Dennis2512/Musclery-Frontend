//
//  CalTrackView.swift
//  MucleryiOS
//
//  Created by Arthur Siebert on 02.10.20.
//

import SwiftUI

struct CalTrackView: View {
    @State private var currentDate = Date()
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
            Rectangle()
                .frame(height: /*@START_MENU_TOKEN@*/85.0/*@END_MENU_TOKEN@*/)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .offset(y: -50)
                .overlay(
                    Text("CalTrack")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .offset(y: -30)
                )
            ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, content: {
                Rectangle()
                    .foregroundColor(.clear)
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.circular/*@END_MENU_TOKEN@*/)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .frame(width: 400.0, height: 150.0)
                    .overlay(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                .stroke()
                                .foregroundColor(.gray)
                                .padding(.top, 0))
                    .overlay(
                        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                                Button(action: {
                                    currentDate = Calendar.current.date(byAdding: .day, value: -1, to: currentDate)!
                                }) {
                                    Image(systemName: "chevron.left")
                                }
                                DatePicker("", selection: $currentDate, displayedComponents: .date)
                                    .labelsHidden()
                                    .frame(width: 340)
                                Button(action: {
                                    currentDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDate)!
                                }) {
                                    Image(systemName: "chevron.right")
                                }
                            })
                            .offset(y: 10)
                            Spacer()
                    }))
                    .offset(y: -4)
                
            })
            .offset(y: -58)
            Spacer()
        })
    }
}

struct CalTrackView_Previews: PreviewProvider {
    static var previews: some View {
        CalTrackView()
    }
}
