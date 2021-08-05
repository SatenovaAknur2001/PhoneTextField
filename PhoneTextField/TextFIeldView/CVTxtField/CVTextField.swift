//
//  CVTextField.swift
//  PhoneTextField
//
//  Created by Акнур on 04.08.2021.
//

import Foundation
import SwiftUI

struct CVTextField: View {
    
    @Binding var cv: String
    @Binding var cplaceholder: String
    
    
    var body: some View {
        HStack{
            TextField(cplaceholder, text: $cv)
                
                .frame(width: 103, height: 48)
                
                .font(.system(size: 16, weight: .regular))
               
                .background(Color.lightBackroundMain)
                .cornerRadius(16.0)
                .multilineTextAlignment(.center)
                
                .onChange(of: cv, perform: { value in
                    cv = format(with: "XXX", month: value)
                })
        }
        
    }
    func format(with mask: String, month: String) -> String {
        let numbers = month.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
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

struct CVTextField_Previews: PreviewProvider {
    static var previews: some View {
        CVTextField(cv: .constant(""), cplaceholder: .constant(""))
    }
}
