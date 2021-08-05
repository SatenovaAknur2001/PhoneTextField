//
//  YYYCustomTextField.swift
//  PhoneTextField
//
//  Created by Акнур on 04.08.2021.
//



import SwiftUI

enum YearTextFieldProperty {
    case phone
    case password
}

struct YearCustomTextField: View {
    @Binding var text: String
    @Binding var placeholder: String
    @Binding var sectionTitle: String
    let fieldProperty: YearTextFieldProperty
   
    
    var body: some View {
        VStack(alignment: .leading) {
            switch fieldProperty {
            case .phone:
                
                YearTextField(year: $text, bplaceholder: $placeholder)
                
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

