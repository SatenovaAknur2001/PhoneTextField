//
//  ApplyView.swift
//  PhoneTextField
//
//  Created by Акнур on 04.08.2021.
//


import SwiftUI

struct ApplyView: View {
    @ObservedObject var login = LoginViewModel()
    @ObservedObject var validateVM = ValidateViewModel()
    var body: some View {
       

        VStack(alignment: .leading, spacing: 30){
        HStack(spacing: 230){
            Text("Подать заявку")
                .fontWeight(.bold)
                .font(.system(size: 20))
                
//                .font(.custom("SFPRODISPLAYBOLD", size: 20))
            .foregroundColor(Color(#colorLiteral(red: 0.2274509804, green: 0.2274509804, blue: 0.2470588235, alpha: 1)))
            
            
        }
            
            
            
            //MARK: -Textfield
            VStack(alignment: .leading, spacing: 5){
                PhoneNumberTextField(phone: $validateVM.phoneNumber, placeholder: $validateVM.placeholderPhoneNumber2, sectionTitle: $validateVM.sectionTitlePhoneNumber)
                
                DocumentTextField(phone: $validateVM.document, placeholder: $validateVM.placeholderDocument, sectionTitle: $validateVM.sectionTitleDocument)
            
            }
            HStack(spacing: 200){
            Button(action: {
                
            }){
               
                Text("Сбросить")
                    .font(.system(size: 16))
                    .foregroundColor(Color(#colorLiteral(red: 0.1529411765, green: 0.6823529412, blue: 0.3764705882, alpha: 1)))
              
            
            }
            Button(action: {
                
            }){
                Text("Подать заявку")
                    .font(.system(size: 16))
                    .foregroundColor(Color(#colorLiteral(red: 0.1529411765, green: 0.6823529412, blue: 0.3764705882, alpha: 1)))
            }
        }
    }
        
    }
}

struct ApplyView_Previews: PreviewProvider {
    static var previews: some View {
        ApplyView()
    }
}

