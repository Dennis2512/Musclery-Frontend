//
//  CalTrackView.swift
//  MucleryiOS
//
//  Created by Arthur Siebert on 02.10.20.
//

import SwiftUI

struct CalTrackView: View {
    @State private var currentDate = Date()
    @State private var targetCal = 2400
    @State private var currentCal = 0
    @State private var leftCal = 2400
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
                //1
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.circular/*@END_MENU_TOKEN@*/)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .frame(width: 400.0, height: 120.0)
                    .overlay(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                .stroke()
                                .foregroundColor(.gray)
                                .padding(.top, 0))
                    .overlay(
                        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                            //Datepicker
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
                            //Seperator
                            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                                .frame(width: 380.0, height: 1.0)
                                .foregroundColor(.gray)
                                .offset(y: 15)
                            //Cals
                            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 50, content: {
                                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                                    Text("\(targetCal)")
                                    Text("Ziel")
                                        .font(.footnote)
                                        .fontWeight(.light)
                                        .foregroundColor(Color.gray)
                                })
                                Text("-")
                                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                                    Text("\(currentCal)")
                                    Text("Aktuell")
                                        .font(.footnote)
                                        .fontWeight(.light)
                                        .foregroundColor(Color.gray)
                                })
                                Text("=")
                                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                                    Text("\(leftCal)")
                                    Text("Uebrig")
                                        .font(.footnote)
                                        .fontWeight(.light)
                                        .foregroundColor(Color.gray)
                                })
                                    
                            })
                            .offset(y: 21)
                            
                            Spacer()
                    }))
                    .offset(y: -4)
                //2
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .frame(width: 400.0, height: 200.0)
                    .overlay(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                .stroke()
                                .foregroundColor(.gray)
                                .padding(.top, 0))
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
