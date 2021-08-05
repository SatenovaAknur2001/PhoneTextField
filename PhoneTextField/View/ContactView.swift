//
//  ContactView.swift
//  PhoneTextField
//
//  Created by Акнур on 04.08.2021.
//

import Foundation

import SwiftUI

struct ContactView: View {
    @ObservedObject var login = LoginViewModel()
    @ObservedObject var validateVM = ValidateViewModel()
    var body: some View {
       

        VStack(alignment: .leading, spacing: 30){
        HStack(spacing: 230){
            Text("Контакт")
                .font(.system(size: 20))
                .fontWeight(.bold)
//                .font(.custom("SFPRODISPLAYBOLD", size: 20))
            .foregroundColor(Color(#colorLiteral(red: 0.2274509804, green: 0.2274509804, blue: 0.2470588235, alpha: 1)))
            
            
        }
            
            
            
            //MARK: -Textfield
            VStack(alignment: .leading, spacing: 5){
                AddNameTextField(username: $login.username)
               
//                AddNumberTextField(username: $login.username)
//                MonthTextField(month: $validateVM.password, placeholder: $validateVM.placeholderPassword)
                
                PhoneNumberTextField(phone: $validateVM.phoneNumber, placeholder: $validateVM.placeholderPhoneNumber, sectionTitle: $validateVM.sectionTitlePhoneNumber)
            
            }
            VStack(spacing: 40){
                VStack{
                    Button(action: {
                        
                    }){
                       
                        Text("Удалить контакт")
                            .font(.system(size: 16))
                            .foregroundColor(Color(#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)))
                            .fontWeight(.bold)
                    
                    }
                }
            HStack(spacing: 260){
            Button(action: {
                
            }){
               
                Text("Сбросить")
                    .font(.system(size: 16))
                    .foregroundColor(Color(#colorLiteral(red: 0.1529411765, green: 0.6823529412, blue: 0.3764705882, alpha: 1)))
              
            
            }
            Button(action: {
                
            }){
                Text("Готово")
                    .font(.system(size: 16))
                    .foregroundColor(Color(#colorLiteral(red: 0.1529411765, green: 0.6823529412, blue: 0.3764705882, alpha: 1)))
            }
        }
        }
    }
        
    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView()
    }
}

struct ContactTextField: View {
    
    @Binding var username: String
//    @StateObject var color = UIColors()
    
    var body: some View {
       
        VStack(alignment: .leading, spacing: 5) {
            Text("     Имя")
                .foregroundColor(Color(#colorLiteral(red: 0.2274509804, green: 0.2274509804, blue: 0.2470588235, alpha: 1)))
                .font(.system(size: 14))
                .multilineTextAlignment(.trailing)
        TextField("Placeholder", text: $username)
//        TextField(image: "done", "", text: $username)
            .padding()
//            .frame(width: 340, height: 48)
            .frame(width: 383, height: 48)
            .background(Color(#colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)))
            .cornerRadius(16.0)
            .padding(.bottom, 20)
        }
    }
}

//struct AddNumberTextField: View {
//
//    @Binding var username: String
////    @StateObject var color = UIColors()
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 5) {
//        Text("     Номер телефона")
//            .foregroundColor(Color(#colorLiteral(red: 0.2274509804, green: 0.2274509804, blue: 0.2470588235, alpha: 1)))
//            .font(.system(size: 14))
//        TextField("+7(_ _ _)_ _ _  _ _ _  _ _ _", text: $username)
////        TextField(image: "done", "", text: $username)
//            .padding()
////            .frame(width: 340, height: 48)
//            .frame(width: 383, height: 48)
//            .background(Color(#colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)))
//            .cornerRadius(16.0)
//            .padding(.bottom, 20)
//        }
//    }
//}
