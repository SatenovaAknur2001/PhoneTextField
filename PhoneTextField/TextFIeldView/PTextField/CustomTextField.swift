//
//  CustomTextField.swift
//  PhoneTextField
//
//  Created by Акнур on 02.08.2021.
//
import SwiftUI

enum TextFieldProperty {
    case phone
    case password
}

struct CustomTextField: View {
    @Binding var text: String
    
    @Binding var placeholder: String
    let imageName: String
    let fieldProperty: TextFieldProperty
    @State private var isSecured: Bool = true
    @State var phoneEditing = false
    @Binding var sectionTitle: String
    
    var body: some View {
        VStack(alignment: .leading) {
            switch fieldProperty {
            case .phone:
                
                PhoneTextField(phone: $text, placeholder: $placeholder, sectionTitle: $sectionTitle)
                
            case .password:
                Text(sectionTitle)
                    .font(.system(size: 14))
                    .foregroundColor(.grayTextDefault)
                    .fontWeight(.regular)
                    .padding([.leading], 80)
                HStack {
                    if isSecured {
                        
                        SecureField(placeholder, text: $text)
                            .padding(.leading, 16)
                            .font(.system(size: 16))
                    } else {
                        TextField(placeholder, text: $text)
                            .padding(.leading, 16)
                            .font(.system(size: 16))
                    }
                    Button(action: {
                        isSecured.toggle()
                    }) {
                        Image(systemName: self.isSecured ? imageName : "eye")
                            .accentColor(.placeholderGray)
                    }.padding(.trailing, 12)
                }
                .frame(height: 48)
                .textFieldStyle(PlainTextFieldStyle())
                .background(Color.lightBackroundMain)
                .cornerRadius(16)
                .padding([.leading, .trailing], 4)
                .frame(height: 48, alignment: .center)
            }
        }
        
    }
}

