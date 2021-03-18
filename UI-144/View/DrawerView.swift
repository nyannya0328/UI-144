//
//  DrawerView.swift
//  UI-144
//
//  Created by にゃんにゃん丸 on 2021/03/14.
//

import SwiftUI

var gra = LinearGradient(gradient: .init(colors: [.green,.purple]), startPoint: .bottom, endPoint: .topTrailing)
struct DrawerView: View {
    @EnvironmentObject var model : MenuViewModel
    var animation : Namespace.ID
    var body: some View {
        VStack{
            
            HStack{
                
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 65, height: 65)
                    .clipShape(Circle())
                
               
                
                
                Spacer()
                
                if model.drawer{
                    DrawerCloseButton(animation: animation)
                }
            }
            .padding()
            
            VStack(alignment: .leading, spacing: 10, content: {
                Text("Hello")
                    .font(.title2)
                
                Text("Cute Girl")
                    .font(.title)
                    .fontWeight(.heavy)
                
                
                
                    
            })
            .foregroundColor(.white)
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding(.horizontal)
            .padding(.top,8)
            
            VStack(spacing:18){
                MenuButton(title: "catalogue", image: "envelope.fill", selected: $model.selectedtab, animation: animation)
                    
                MenuButton(title: "Sun", image: "sun.min", selected: $model.selectedtab, animation: animation)
                    
                MenuButton(title: "Moon", image: "moon.fill", selected: $model.selectedtab, animation: animation)
                    
                MenuButton(title: "Person", image: "person", selected: $model.selectedtab, animation: animation)
                   
            }
            .padding(.top,30)
            Divider()
                .background(Color.white)
                .padding(.top,30)
                .padding(.horizontal,25)
            
            Spacer()
            
            MenuButton(title: "Person", image: "person", selected: .constant(""), animation: animation)
                .padding(.bottom)
            
            
            
           
        }
        .frame(width: 250)
        .background(gra.ignoresSafeArea(.all, edges: .vertical))
        
    }
}

struct DrawerView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct DrawerCloseButton : View {
    
    @EnvironmentObject var model : MenuViewModel
    var animation : Namespace.ID
    var body: some View{
        
        Button(action: {
            withAnimation(.easeInOut){
                
                model.drawer.toggle()
            }
            
        }) {
            
            VStack(spacing:5){
                
                
                Capsule()
                    .fill(model.drawer ? Color.white : Color.primary)
                    .frame(width: 35, height: 3)
                    .rotationEffect(.init(degrees: model.drawer ? -50 : 0))
                    .offset(x: model.drawer ? 2 : 0, y: model.drawer ? 9 : 0)
                
                
                VStack(spacing:5){
                    
                    Capsule()
                        .fill(model.drawer ? Color.white : Color.primary)
                        .frame(width: 35, height: 3)
                    
                    Capsule()
                        .fill(model.drawer ? Color.white : Color.primary)
                        .frame(width: 35, height: 3)
                        .offset(y: model.drawer ? -8 : 0)
                    
                    
                }
                .rotationEffect(.init(degrees: model.drawer ? 50 : 0))
                
            }
            
        }
        .scaleEffect(0.8)
        .matchedGeometryEffect(id: "Menu", in: animation)
    }
}
