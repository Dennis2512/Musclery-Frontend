//
//  BMIView.swift
//  MucleryiOS
//
//  Created by Arthur Siebert on 22.11.20.
//

import SwiftUI

struct BMIView: View {
    @State var heightInCM = 187
    @State var weightInKG = 87
    @State var age = 25
    @State var gender = "male"
    @State var bmi = 25.74
    var body: some View {
        NavigationView{
            ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, content: {
                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 10, content: {
                    HStack(alignment: .center, spacing: 70.0, content: {
                        Image(systemName: "arrow.up.and.down.circle")
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        Text("Body Height")
                        Text("\(heightInCM) cm")
                    })
                    HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 74.5, content: {
                        Image(systemName: "arrow.left.and.right.circle")
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        Text("Body Weight")
                        Text("\(weightInKG) kg")
                    })
                    HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 118.5, content: {
                        Image(systemName: "18.circle")
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        Text("Age")
                        Text("\(age)")
                    })
                    HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 97.0, content: {
                        Image(systemName: "questionmark.circle")
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        Text("Gender")
                        Text("\(gender)")
                    })
                })
                .padding(.bottom)
                
                NavigationLink(destination: PersonalSettingsView()) { RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                    .padding(.horizontal)
                    .frame(height: 40.0)
                    .foregroundColor(.blue)
                    .overlay(
                        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                            Image(systemName: "gear").foregroundColor(.white)
                            Text("Edit in Settings").foregroundColor(.white)
                        })
                        
                    ) }
                // data end
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                    .padding(.horizontal, 10.0)
                    .frame(height: 4.0)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .opacity(0.4)
                    .offset(y: 15)
                //BMI Value
                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 97.0, content: {
                    Image(systemName: "gauge")
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    Text("BMI Value")
                    Text("\(gender)")
                })
                .offset(y: 25)
                //bmi end
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                    .padding(.horizontal, 10.0)
                    .frame(height: 4.0)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .opacity(0.4)
                    .offset(y: 30)
                //BMI Table
                
                Text("BMI Table")
                    .font(.title2)
                    .fontWeight(.bold)
                    .offset(y: 50)
                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                    HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 75, content: {
                        Text("Age")
                            .font(.title3)
                            .fontWeight(.bold)
                        Text("Man")
                            .font(.title3)
                            .fontWeight(.bold)
                        Text("Woman")
                            .font(.title3)
                            .fontWeight(.bold)
                    })
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                        .padding(.horizontal, 20.0)
                        .frame(height: 4.0)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        .opacity(0.2)
                    HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 65, content: {
                        Text("19-24")
                        Text("25-29,9")
                        Text("24-28,9")
                        
                    })
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                        .padding(.horizontal, 20.0)
                        .frame(height: 4.0)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        .opacity(0.2)
                    HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 65, content: {
                        Text("25-34")
                        Text("26-30,9")
                        Text("25-29,9")
                    })
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                        .padding(.horizontal, 20.0)
                        .frame(height: 4.0)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        .opacity(0.2)
                    HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 65, content: {
                        Text("35-44")
                        Text("27-30,9")
                        Text("26-30,9")
                    })
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                        .padding(.horizontal, 20.0)
                        .frame(height: 4.0)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        .opacity(0.2)
                    HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 65, content: {
                        Text("45-54")
                        Text("27-30,9")
                        Text("26-30,9")
                    })
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                        .padding(.horizontal, 20.0)
                        .frame(height: 4.0)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        .opacity(0.2)
                   
                })
                .offset(y: 70)
                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                    HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 65, content: {
                        Text("55-64")
                        Text("27-30,9")
                        Text("26-30,9")
                    })
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                        .padding(.horizontal, 20.0)
                        .frame(height: 4.0)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        .opacity(0.2)
                    HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 66.0, content: {
                        Text(">64    ")
                        Text("27-30,9")
                        Text("26-30,9")
                    })
                })
                .offset(y: 70)
            })
           
            
        }
    }
}

struct BMIView_Previews: PreviewProvider {
    static var previews: some View {
        BMIView()
    }
}
