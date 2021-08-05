//
//  SizeView.swift
//  PhoneTextField
//
//  Created by Акнур on 04.08.2021.
//

import SwiftUI

struct SizeView: View {
    @ObservedObject var validateVM = ValidateViewModel()
    var body: some View {
        VStack(spacing: 27){
        VStack(alignment: .leading, spacing: 24){
            HStack(spacing: 210){
                Text("Общая площадь")
                    .foregroundColor(.grayTextDefault)
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                Button(action: {
                    
               
                }){
                Image("discard")
                }
            }
            SizeTextField(phone: $validateVM.after, placeholder: $validateVM.sizeafterPlaceholder, sectionTitle: $validateVM.sectionTitleAfter)
            SizeTextField(phone: $validateVM.before, placeholder: $validateVM.sizebeforePlaceholder, sectionTitle: $validateVM.sectionTitleBefore)
        }
        
            HStack(spacing: 270){
            Button(action: {
                
            }){
                Text("Сбросить")
                    .foregroundColor(.accentGreenMain)
                    .font(.system(size: 14))
        }
            Button(action: {
                
            }){
                Text("Готово")
                    .foregroundColor(.accentGreenMain)
                    .font(.system(size: 16))
                    .fontWeight(.bold)
        }
    }
    }
}
}
struct SizeView_Previews: PreviewProvider {
    static var previews: some View {
        SizeView()
    }
}
