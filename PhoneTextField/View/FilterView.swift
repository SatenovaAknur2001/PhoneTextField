//
//  FilterView.swift
//  PhoneTextField
//
//  Created by Акнур on 04.08.2021.
//

import SwiftUI


struct FilterView: View {
    @ObservedObject var login = LoginViewModel()
    var body: some View {
       

        VStack(alignment: .leading, spacing: 24){
        HStack(spacing: 160){
            Text("Сохранить фильтр")
                .font(.system(size: 20))
                .fontWeight(.bold)
//                .font(.custom("SFPRODISPLAYBOLD", size: 20))
            .foregroundColor(Color(#colorLiteral(red: 0.2274509804, green: 0.2274509804, blue: 0.2470588235, alpha: 1)))
            
            Button(action: {
                
            }){
                Image("discard")
                    .frame(width: 24, height: 24)
            }
                
        }
            
            Text("Сохраненный поиск с такими параметрами уже   существует в разделе Сохраненные поиски")
                .multilineTextAlignment(.center)
                .font(.system(size: 16))
            
            //MARK: -Textfield
            VStack(alignment: .center, spacing: 5){
            NameTextField(username: $login.username)
               .keyboardType(.numbersAndPunctuation)
            
            Button(action: {
      
                      print("vdd")
                      }) {
      
                HStack{
      
                              Text("Сохранить")
                                  .font(.custom("SFProDisplay-Regular", size: 16))
                                  .foregroundColor(Color.white)
                          }
                          .frame(width: 383, height: 48)
                          .background(Color(red: 39/255, green: 174/255, blue: 96/255, opacity: 1))
                          .cornerRadius(12.0)
                      }
            }
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}

struct NameTextField: View {
    
    @Binding var username: String
//    @StateObject var color = UIColors()
    
    var body: some View {
       
        
        TextField("Введите название фильтра", text: $username)
//        TextField(image: "done", "", text: $username)
            .padding()
//            .frame(width: 340, height: 48)
            .frame(width: 383, height: 48)
            .background(Color(#colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)))
            .cornerRadius(16.0)
            .padding(.bottom, 20)
        
    }
}

