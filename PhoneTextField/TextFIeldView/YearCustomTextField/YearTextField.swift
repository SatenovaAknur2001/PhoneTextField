//
//  YearTextField.swift
//  PhoneTextField
//
//  Created by Акнур on 04.08.2021.
//


import SwiftUI

struct YearTextField: View {
    
    @Binding var year: String
    @Binding var bplaceholder: String
    
    
    var body: some View {
        HStack{
            TextField(bplaceholder, text: $year)
                
                .frame(width: 103, height: 48)
                
                .font(.system(size: 16, weight: .regular))
               
                .background(Color.lightBackroundMain)
                .cornerRadius(16.0)
                .multilineTextAlignment(.center)
                
                .onChange(of: year, perform: { value in
                    year = format(with: "XXXX", month: value)
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

struct YearTextField_Previews: PreviewProvider {
    static var previews: some View {
        YearTextField(year: .constant(""), bplaceholder: .constant(""))
    }
}

