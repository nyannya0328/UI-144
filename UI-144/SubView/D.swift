//
//  D.swift
//  UI-144
//
//  Created by にゃんにゃん丸 on 2021/03/14.
//

import SwiftUI

struct D: View {
    
    @State var maxHight : CGFloat = UIScreen.main.bounds.height / 3
    @State var sliderprogress : CGFloat = 0
    @State var sliderHight : CGFloat = 0
    @State var lastDargValue : CGFloat = 0
    var body: some View {
        
    
        NavigationView{
            
            
            VStack{
                TextShimer(text:"Dash Board")
                   
                    
                    .padding(.bottom,30)
                ZStack(alignment: .bottom) {
                   
                Rectangle()
                    .fill(Color.red.opacity(0.15))
                    
                    Rectangle()
                        .fill(Color.red)
                        .frame(height: sliderHight)
                    
                    
                }
                .frame(width: 100, height: maxHight)
                .cornerRadius(15)
                .overlay(
                
                Text("\(Int(sliderprogress * 100))%")
                    .fontWeight(.semibold)
                    .foregroundColor(.green)
                    .padding(.vertical,10)
                    .padding(.horizontal,18)
                    .background(
                    
                  RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.white,lineWidth: 5)
                    
                    )
                    .cornerRadius(10)
                    .padding(.vertical,25)
                    .offset(y: sliderHight < maxHight - 105 ? -sliderHight : -maxHight + 105)
                    
                    ,alignment: .bottom
                )
             
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .gesture(DragGesture(minimumDistance:0).onChanged({ (Value) in
                
                let translation = Value.translation
                sliderHight = -translation.height + lastDargValue
                
                sliderHight = sliderHight > maxHight ? maxHight : sliderHight
                
                sliderHight = sliderHight >= 0 ? sliderHight : 0
                
                let progress = sliderHight / maxHight
                sliderprogress = progress <= 1.0 ? progress : 1
                
            }).onEnded({ (value) in
                sliderHight = sliderHight > maxHight ? maxHight : sliderHight
                
                sliderHight = sliderHight >= 0 ? sliderHight : 0
                
                lastDargValue = sliderHight
                
            }))
            
            .navigationTitle("Dash Board")
            
           
           
        }
        .preferredColorScheme(.dark)
        
    }
}

struct D_Previews: PreviewProvider {
    static var previews: some View {
        D()
    }
}

struct TextShimer : View {
    @State var animation = false
    var text : String
    var body: some View{
        
        ZStack{
            
            Text(text)
                .font(.system(size: 70))
                .bold()
                .background(Color.white.opacity(0.25))
            
            HStack(spacing:0){
                
                
                ForEach(0..<text.count,id:\.self){index in
                    
                    Text(String(text[text.index(text.startIndex, offsetBy: index)]))
                        .font(.system(size: 70))
                        .bold()
                        .foregroundColor(RandomColor())
                       
                    
                       
                        
                    
                }
            }
            .mask(
            
            Rectangle()
                .fill(LinearGradient(gradient: .init(colors: [.red,.blue]), startPoint:.bottom, endPoint: .top))
                .rotationEffect(.init(degrees: 70))
                .padding(20)
                .offset(x: -250)
                .offset(x: animation ? 500 : 0)
                
            
            )
            
            .onAppear(perform: {
                
                withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)){
                    
                    animation.toggle()
                }
                
                
            })
            
        }
    }
    func RandomColor()->Color{
        
        let color = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
        return Color(color)
    }
}
