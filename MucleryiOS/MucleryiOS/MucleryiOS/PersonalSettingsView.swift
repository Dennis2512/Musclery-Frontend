//
//  PersonalSettingsView.swift
//  MucleryiOS
//
//  Created by Arthur Siebert on 22.11.20.
//

import SwiftUI

struct PersonalSettingsView: View {
    
    @State var name = ""
    @State var gender = "male"
    @State var age = ""
    @State var height = ""
    @State var weight = ""
    @State var calGoal = ""
    @State var activityLevel = ""
    var body: some View {
        NavigationView{
            ScrollView{
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
                    .overlay(Picker(selection: self.$gender, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/) {
                        Text("male").tag(1)
                        Text("female").tag(1)
                    }
                    .padding(.horizontal)
                    
                    )
                    .padding(.vertical, 10.0)
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
                        TextField("Name", text: self.$name)
                                    .padding(.leading, 30.0)
                    )
               
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
                        TextField("Age(years)", text: self.$age)
                                    .padding(.leading, 30.0)
                    )
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
                        TextField("Height(cm)", text: self.$height)
                                    .padding(.leading, 30.0)
                    )
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
                        TextField("Weight(kg)", text: self.$weight)
                                    .padding(.leading, 30.0)
                    )
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
                        TextField("Calories Goal (kcal)", text: self.$calGoal)
                                    .padding(.leading, 30.0)
                    )
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
                        TextField("Activity Level", text: self.$activityLevel)
                                    .padding(.leading, 30.0)
                    )
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                        .padding(.horizontal)
                        .frame(height: 40.0)
                        .foregroundColor(.blue)
                        .overlay(
                            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                                //Image(systemName: "gear").foregroundColor(.white)
                                Text("Save").foregroundColor(.white)
                            })
                            
                        )
                })
                .padding(.horizontal, 80.0)
                .padding(.top, 20.0)

                
                
                
            }
            
        }
    }
}

struct PersonalSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalSettingsView()
    }
}
