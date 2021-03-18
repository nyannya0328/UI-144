//
//  Catalogue.swift
//  UI-144
//
//  Created by にゃんにゃん丸 on 2021/03/14.
//

import SwiftUI

struct Catalogue: View {
    @Environment(\.colorScheme) var scheme
    var body: some View {
        NavigationView{
            
            ScrollView{
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    Image("ss")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250, height: 250)
                        .offset(x: -20, y: -10)
                    
                    Text("Star Bucks")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(.primary)
                    
                    Text("Great Coffee")
                        .foregroundColor(.gray)
                }
                .padding(.bottom,45)
                .padding(.leading,7)
                .frame(maxWidth: .infinity,alignment: .leading)
                .background(Color.primary.opacity(0.1) .padding(.top,53).cornerRadius(20))
             
                .offset(x: 70)
                .overlay(
                
                    Button(action: {}, label: {
                        Image(systemName: "bag.fill")
                            .font(.title)
                            .foregroundColor(scheme == .dark ? .black : .white)
                            .padding(20)
                            .background(Color.primary)
                            .cornerRadius(15)
                            .offset(x: -30, y: 30)
                    })
                    
                    ,alignment: .bottomTrailing
                )
                .padding(.vertical,35)
                
                CardView(image: "ss", title: "Starubucks", title2: "Amazing")
                    .padding(.top,25)
                
                CardView(image: "ff", title: "Super", title2: "Cup")
                
               
            }
        }
    }
}

struct Catalogue_Previews: PreviewProvider {
    static var previews: some View {
        Catalogue()
    }
}

struct CardView : View {
    var image : String
    var title : String
    var title2 : String
    var body: some View{
        
        HStack{
            
           Image(image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 100, height: 100)
            
            VStack(alignment: .leading, spacing: 8) {
                
                Text(title)
                    .font(.title2)
                    .bold()
                
                Text(title2)
                    .font(.caption)
                    .foregroundColor(.gray)
                
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            
        }
    }
}
