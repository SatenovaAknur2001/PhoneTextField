//
//  EditingView.swift
//  PhoneTextField
//
//  Created by Акнур on 04.08.2021.
//




import SwiftUI

struct EditingView: View {
    @ObservedObject var login = LoginViewModel()
    @ObservedObject var validateVM = ValidateViewModel()
    var body: some View {
       

        VStack(alignment: .center, spacing: 30){
        HStack(spacing: 160){
            Text("Редактирование ФИО")
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
            
            
            
            //MARK: -Textfield
            VStack(alignment: .leading, spacing: 5){
                EditSurnameTextField(username: $login.username)
          
                EditNameTextField(username: $login.username)
                
                EditLastNameTextField(username: $login.username)
            
            }
            HStack(spacing: 280){
            Button(action: {
                
            }){
               
                Text("Отмена")
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

struct EditingView_Previews: PreviewProvider {
    static var previews: some View {
        EditingView()
    }
}

struct EditSurnameTextField: View {
    
    @Binding var username: String
//    @StateObject var color = UIColors()
    
    var body: some View {
       
        VStack(alignment: .leading, spacing: 5) {
            HStack(alignment: .top) {
            Text("    Фамилия")
                .foregroundColor(Color(#colorLiteral(red: 0.2274509804, green: 0.2274509804, blue: 0.2470588235, alpha: 1)))
                .font(.system(size: 14))
                .multilineTextAlignment(.trailing)
                Image("star")
                
                    
            }
            
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

struct EditNameTextField: View {
    
    @Binding var username: String
//    @StateObject var color = UIColors()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack(alignment: .top) {
            Text("    Имя")
                .foregroundColor(Color(#colorLiteral(red: 0.2274509804, green: 0.2274509804, blue: 0.2470588235, alpha: 1)))
                .font(.system(size: 14))
                .multilineTextAlignment(.trailing)
                Image("star")
                
                    
            }
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

struct EditLastNameTextField: View {
    
    @Binding var username: String
//    @StateObject var color = UIColors()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
        Text("   Отчество (при наличии)")
            .foregroundColor(Color(#colorLiteral(red: 0.2274509804, green: 0.2274509804, blue: 0.2470588235, alpha: 1)))
            .font(.system(size: 14))
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

