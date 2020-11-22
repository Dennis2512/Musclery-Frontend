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
    @State private var breakfast = 0
    @State private var breakfastCal = 900
    @State private var lunch = 0
    @State private var lunchCal = 0
    @State private var dinner = 0
    @State private var dinnerCal = 0
    var body: some View {
        //NavigationView{
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
                NavigationView{
                ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, content: {
                    Rectangle()
                        .foregroundColor(.clear)
                    //Date + Cal
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.circular/*@END_MENU_TOKEN@*/)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .frame(width: 365.0, height: 120.0)
                        .overlay(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                    .stroke()
                                    .foregroundColor(.blue)
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
                                        .frame(width: 310)
                                    Button(action: {
                                        currentDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDate)!
                                    }) {
                                        Image(systemName: "chevron.right")
                                    }
                                })
                                .accentColor(.black)
                                .offset(y: 10)
                                //Seperator
                                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                                    .frame(width: 345.0, height: 1.0)
                                    .foregroundColor(.gray)
                                    .offset(y: 15)
                                //Cals
                                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 44, content: {
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
                    //Fruehstueck
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .frame(width: 365, height: 100.0)
                        .overlay(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                    .stroke()
                                    .foregroundColor(.blue)
                                    .padding(.top, 0))
                        .overlay(VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 220, content: {
                                Text("Fruehstueck")
                                    .foregroundColor(.black)
                                Text("\(breakfastCal)")
                            })
                            //Nahrungsmittelliste
                            //Text("Placeholder")
                            //End
                            NavigationLink(
                                destination: newBreakfastView(),
                                label: {
                                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                                        .padding(.bottom, -2.0)
                                        .padding(.top, 2.0)
                                        .foregroundColor(.blue)
                                        .frame(width: 350.0, height: 37.0)
                                        .overlay(HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                                            Text("Nahrungsmittel Hinzufuegen")
                                                .offset(y: 2)
                                                .foregroundColor(.white)
                                        }))
                                        .offset(y: 7)
                                })
                        }))
                    //Mittagessen
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .frame(width: 365, height: 100.0)
                        .overlay(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                    .stroke()
                                    .foregroundColor(.blue)
                                    .padding(.top, 0))
                        .overlay(VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 237, content: {
                                Text("Mittagessen")
                                    .foregroundColor(.black)
                                Text("\(lunchCal)")
                            })
                            //Nahrungsmittelliste
                            //Text("Placeholder")
                            //End
                            NavigationLink(
                                destination: NewLunchView(),
                                label: {
                                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                                        .padding(.bottom, -2.0)
                                        .padding(.top, 2.0)
                                        .foregroundColor(.blue)
                                        .frame(width: 350.0, height: 37.0)
                                        .overlay(HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                                            Text("Nahrungsmittel Hinzufuegen")
                                                .offset(y: 2)
                                                .foregroundColor(.white)
                                        }))
                                        .offset(y: 7)
                                })
                        }))
                    //Abendessen
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .frame(width: 365, height: 100.0)
                        .overlay(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                    .stroke()
                                    .foregroundColor(.blue)
                                    .padding(.top, 0))
                        .overlay(VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 237, content: {
                                Text("Abendessen")
                                    .foregroundColor(.black)
                                Text("\(dinnerCal)")
                            })
                            //Nahrungsmittelliste
                            //Text("Placeholder")
                            //End
                            NavigationLink(
                                destination: NewDinnerView(),
                                label: {
                                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                                        .padding(.bottom, -2.0)
                                        .padding(.top, 2.0)
                                        .foregroundColor(.blue)
                                        .frame(width: 350.0, height: 37.0)
                                        .overlay(HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                                            Text("Nahrungsmittel Hinzufuegen")
                                                .offset(y: 2)
                                                .foregroundColor(.white)
                                        }))
                                        .offset(y: 7)
                                })
                        }))
                    HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                        NavigationLink(
                            destination: NaehrwerteView(),
                            label: {
                                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                                    .padding(.horizontal)
                                    .frame(height: 40.0)
                                    .foregroundColor(.blue)
                                    .overlay(
                                        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                                            Image(systemName: "chart.pie.fill").foregroundColor(.white)
                                            Text("Nährwerte").foregroundColor(.white)
                                        })
                                        
                                    )
                            })
                        NavigationLink(
                            destination: NotesView(),
                            label: {
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
                    })
                    .offset(y: 10)
                })
               // .offset(y: -58)
               .padding(.bottom, -180)
              
                Spacer()
            }
                .offset(y: -58)
            })
            //.offset(y: -95)
        //}
    }
}

struct CalTrackView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
