//
//  ContentView.swift
//  PhoneTextField
//
//  Created by Акнур on 02.08.2021.
//

import SwiftUI

struct CardView: View {
    @ObservedObject var validateVM = ValidateViewModel()
    var body: some View {
        
        VStack {
            VStack(alignment: .leading, spacing: 24){
                
                Text("Редактирование карты")
                    .font(.system(size: 20))
                    .foregroundColor(Color(#colorLiteral(red: 0.2274509804, green: 0.2274509804, blue: 0.2470588235, alpha: 1)))
                    .fontWeight(.bold)
                
                CustomTextField(text: $validateVM.phone, placeholder: $validateVM.placeholderPhone, imageName: "", fieldProperty: .phone, sectionTitle: $validateVM.sectionTitlePhone)
                
                
                HStack(spacing: 40){
                    MonthTextField(month: $validateVM.password, placeholder: $validateVM.placeholderPassword)
                    
                    YearTextField(year: $validateVM.year, bplaceholder: $validateVM.yearplaceholder)
                    
                    //                MonthTextField(month: $validateVM.cv, placeholder: $validateVM.CVPlaceholder)
                    CVTextField(cv: $validateVM.cv, cplaceholder: $validateVM.CVPlaceholder)
                }
                
                
                HStack(spacing: 280){
                    Button(action: {
                        
                    }){
                        Text("Отмена")
                            .font(.system(size: 14))
                            .foregroundColor(Color(#colorLiteral(red: 0.1529411765, green: 0.6823529412, blue: 0.3764705882, alpha: 1)))
                    }
                    Button(action: {
                        
                    }){
                        Text("Готово")
                            .font(.system(size: 16))
                            .foregroundColor(Color(#colorLiteral(red: 0.1529411765, green: 0.6823529412, blue: 0.3764705882, alpha: 1)))
                            .fontWeight(.bold)
                    }
                }
                
            }
            .padding()
        }
        .padding([.top], 200)
    }
}
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
