//
//  PhoneNumberTextField.swift
//  PhoneTextField
//
//  Created by Акнур on 04.08.2021.
//

import Foundation
import SwiftUI


struct PhoneNumberTextField: View {
    
    @Binding var phone: String
    @Binding var placeholder: String
    @Binding var sectionTitle: String
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(sectionTitle)
                .font(.system(size: 14))
                .foregroundColor(.grayTextDefault)
                .fontWeight(.regular)
            
            HStack {
              
                
                TextField(placeholder, text: $phone)
                    .font(.system(size: 16, weight: .regular))
                    .frame(width: 343, height: 48)
                    .onChange(of: phone, perform: { value in
                        phone = format(with: "+X(XXX) XXX XX XX", phone: value)
                    })
                
                
            }
            .frame(height: 48)
            .textFieldStyle(PlainTextFieldStyle())
            .background(Color.lightBackroundMain)
            .cornerRadius(16)
            .padding([.leading, .trailing], 4)
            
        }
        
    }
    
    func format(with mask: String, phone: String) -> String {
        let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex
        
        for ch in mask where index < numbers.endIndex {
            if ch == "X" {
                result.append(numbers[index])
                
                index = numbers.index(after: index)
                
            } else {
                result.append(ch)
            }
        }
        return result
    }
}

struct PhoneNumberTextField_Previews: PreviewProvider {
    static var previews: some View {
        PhoneNumberTextField(phone: .constant(""), placeholder: .constant(""), sectionTitle: .constant(""))
    }
}
