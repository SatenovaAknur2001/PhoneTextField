//
//  CVCustomTextfield.swift
//  PhoneTextField
//
//  Created by Акнур on 04.08.2021.
//


import SwiftUI

enum CVTextFieldProperty {
    case phone
    case password
}

struct CVCustomTextField: View {
    @Binding var text: String
    @Binding var placeholder: String
    @Binding var sectionTitle: String
    let fieldProperty: CVTextFieldProperty
   
    
    var body: some View {
        VStack(alignment: .leading) {
            switch fieldProperty {
            case .phone:
                
                CVTextField(cv: $text, cplaceholder: $placeholder)
                
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

