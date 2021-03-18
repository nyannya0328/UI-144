//
//  MenuButton.swift
//  UI-144
//
//  Created by にゃんにゃん丸 on 2021/03/14.
//

import SwiftUI

struct MenuButton: View {
    var title : String
    var image : String
    @Binding var selected : String
    var animation : Namespace.ID
    var body: some View {
        Button(action: {
            
            withAnimation(.spring()){
                
                selected = title
            }
            
        }, label: {
            HStack{
                
                
                Image(systemName: image)
                    .font(.title2)
                    .foregroundColor(selected == title ? .black : .white)
                
                Text(title)
                    .foregroundColor(selected == title ? .black : .white)
            }
            .padding(.horizontal)
            .padding(.vertical,12)
            .frame(width: 200,alignment: .leading)
            .background(
                ZStack{
                    
                    if selected == title{
                        
                        Color.white
                            .cornerRadius(10)
                            .matchedGeometryEffect(id: "Tab", in: animation)
                    }
                    else{
                        
                        Color.clear
                    }
                }
            )
            
        })
    }
}

struct MenuButton_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
