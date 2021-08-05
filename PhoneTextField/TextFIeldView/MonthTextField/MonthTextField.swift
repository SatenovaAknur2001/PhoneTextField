import SwiftUI




struct MonthTextField: View {
    
    @Binding var month: String
    @Binding var placeholder: String
    
    
    var body: some View {
        HStack{
            TextField(placeholder, text: $month)
                
                .frame(width: 103, height: 48)
                
                .font(.system(size: 16, weight: .regular))
               
                .background(Color.lightBackroundMain)
                .cornerRadius(16.0)
                .multilineTextAlignment(.center)
                
                .onChange(of: month, perform: { value in
                    month = format(with: "XX", month: value)
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

struct MonthextField_Previews: PreviewProvider {
    static var previews: some View {
        MonthTextField(month: .constant(""), placeholder: .constant(""))
    }
}

