//
//  MonthCustomTextField.swift
//  PhoneTextField
//
//  Created by Акнур on 03.08.2021.
//

import SwiftUI

enum MonthTextFieldProperty {
    case phone
    case password
}

struct MonthCustomTextField: View {
    @Binding var text: String
    @Binding var placeholder: String
    @Binding var sectionTitle: String
    let fieldProperty: MonthTextFieldProperty
   
    
    var body: some View {
        VStack(alignment: .leading) {
            switch fieldProperty {
            case .phone:
                
                MonthTextField(month: $text, placeholder: $placeholder)
                
            case .password:
                Text(text)
                    .font(.system(size: 14))
                    .foregroundColor(.grayTextDefault)
                    .fontWeight(.regular)
                    .padding([.top], 50)
//                HStack {     
//                        TextField(placeholder, text: $text)
//                            .padding(.leading, 26)
//                            .font(.system(size: 16))
//                }
//                .frame(width: 203, height: 48)
//                .background(Color.red)
//                .cornerRadius(16)
            }
        }
        
    }
}

