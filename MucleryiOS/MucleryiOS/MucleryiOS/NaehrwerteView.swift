//
//  NaehrwerteView.swift
//  MucleryiOS
//
//  Created by Arthur Siebert on 18.11.20.
//

import SwiftUI

struct NaehrwerteView: View {
    @State var calPercentIs = 915.0
    @State var calPercentGoal = 2400.0
    @State var calPercent = 0.5
    @State var carbonPercentIs = 652.0
    @State var carbonPercentGoal = 317.0
    @State var carbonPercent = 0.5
    @State var proteinsPercentIs = 116.5
    @State var proteinsPercentGoal = 86.0
    @State var proteinsPercent = 0.5
    @State var fatsPercentIs = 60.3
    @State var fatsPercentGoal = 79.0
    @State var fatsPercent = 0.5
    var body: some View {
        Group{
        NavigationView{
            ScrollView{
                Text("Zielwerte")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal)
                    .frame(width: 500.0)
                    .offset(x: -110)
                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                    VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 7, content: {
                        Text("Kalorien")
                            .multilineTextAlignment(.leading)
                        Text("Kohlenhydrate")
                            .multilineTextAlignment(.leading)
                        Text("Proteine")
                            .multilineTextAlignment(.leading)
                        Text("Fette")
                            .multilineTextAlignment(.leading)
                    })
                    VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 9.0, content: {
                        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: -1, content: {
                            Text("\(calPercentIs,specifier: "%.0f")/\(calPercentGoal,specifier: "%.0f")")
                                .font(.footnote)
                                .fontWeight(.light)
                            ProgressView(value: self.calPercent)
                                .frame(width: 200.0)
                                .accentColor(.yellow)
                        })
                        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: -1, content: {
                            Text("\(carbonPercentIs,specifier: "%.0f")/\(carbonPercentGoal,specifier: "%.0f")")
                                .font(.footnote)
                                .fontWeight(.light)
                            ProgressView(value: self.carbonPercent)
                                .frame(width: 200.0)
                        })
                        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: -1, content: {
                            Text("\(proteinsPercentIs,specifier: "%.0f")/\(proteinsPercentGoal,specifier: "%.0f")")
                                .font(.footnote)
                                .fontWeight(.light)
                            ProgressView(value: self.proteinsPercent)
                                .frame(width: 200.0)
                                .accentColor(.green)
                        })
                        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: -1, content: {
                            Text("\(fatsPercentIs,specifier: "%.0f")/\(fatsPercentGoal,specifier: "%.0f")")
                                .font(.footnote)
                                .fontWeight(.light)
                            ProgressView(value: self.fatsPercent)
                                .frame(width: 200.0)
                                .accentColor(.red)
                        })
                    })
                    .offset(y: -6)
                    VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 7, content: {
                        Text("\(calPercent*100,specifier: "%.0f")%")
                        Text("\(carbonPercent*100,specifier: "%.0f")%")
                        Text("\(proteinsPercent*100,specifier: "%.0f")%")
                        Text("\(fatsPercent*100,specifier: "%.0f")%")
                    })
                })
                .padding(.top, 10.0)
            }
        }
    }
        .onAppear(perform: {
            self.calPercent = calPercentIs/calPercentGoal
            self.carbonPercent = carbonPercentIs/carbonPercentGoal
            self.proteinsPercent = proteinsPercentIs/proteinsPercentGoal
            self.fatsPercent = fatsPercentIs/fatsPercentGoal
        })
    }
}

struct NaehrwerteView_Previews: PreviewProvider {
    static var previews: some View {
        NaehrwerteView()
    }
}
