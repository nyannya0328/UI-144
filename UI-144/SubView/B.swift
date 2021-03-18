//
//  B.swift
//  UI-144
//
//  Created by にゃんにゃん丸 on 2021/03/14.
//

import SwiftUI

struct B: View {
    @State var ison = false
    var body: some View {
        NavigationView{
            
            VStack{
                
                CustomRecTangle(ison: $ison)
                Toggle(isOn: $ison, label: {
                    
                    Text(ison ? "ON" : "Off")
                        .font(.title)
                        .bold()
                        .foregroundColor(ison ? .red : .gray)
                    
                    
                    
                })
                
            }
            .frame(width: 250, height: 350)
            .navigationTitle("Animation")
                
        }
        
        
    }
}

struct B_Previews: PreviewProvider {
    static var previews: some View {
        B()
    }
}

struct CustomRecTangle : View {
    @State var offsets : [CGSize] = Array(repeating: .zero, count: 3)
    
    @State var timer = Timer.publish(every: 4, on: .main, in: .common).autoconnect()
    
    @State var delay : Double = 0
    @Binding var ison : Bool
    var locations : [CGSize] = [
        
        CGSize(width: 110, height: 0),
        CGSize(width: 0, height: -110),
        CGSize(width: -110, height: 0),
        
        
        CGSize(width: 110, height: 110),
        CGSize(width: 110, height: -110),
        CGSize(width: -110, height: -110),
        
        
        CGSize(width: 0, height: 110),
        CGSize(width: 110, height: 0),
        CGSize(width: 0, height: -110),
        
        CGSize(width: 0, height: 0),
        CGSize(width: 0, height: 0),
        CGSize(width: 0, height: 0),
    
    
    
    ]
    var body: some View{
        
        ZStack{
            
            Color.blue
                .ignoresSafeArea()
            
            VStack(spacing:10){
                
                HStack(spacing:15){
                    
                    Rectangle()
                        .fill(Color.pink)
                        .frame(width: 100, height: 100)
                        .offset(offsets[0])
                    
                    
                }
                .frame(width: 210,alignment: .leading)
                
                HStack(spacing:10){
                    
                    Rectangle()
                        .stroke(Color.green,lineWidth: 5)
                        .frame(width: 100, height: 100)
                        .offset(offsets[1])
                    
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 100, height: 100)
                        .offset(offsets[2])
                    
                }
                
            }
            
            
            
            
            
        }
        .onAppear(perform: doAnimation)
        .onReceive(timer,perform: { _ in
        delay = 0
            doAnimation()
        })
        
        
    }
    func doAnimation(){
        
        var tempoffsets : [[CGSize]] = []
        var currentset : [CGSize] = []
        
        for value in locations{
            
            currentset.append(value)
            
            if currentset.count == 3{
                
                tempoffsets.append(currentset)
                currentset.removeAll()
            }
        }
        
        if !currentset.isEmpty{
            
            tempoffsets.append(currentset)
            tempoffsets.removeAll()
            
           
        }
        for offset in tempoffsets{
            
            if ison{
                for index in offset.indices{
                
                doAnimation(delay: .now() + delay, value: offset[index], index: index)
                
                delay += 0.3
                }
            }
        }
        
        
        
    }
    
    func doAnimation(delay:DispatchTime,value:CGSize,index:Int){
        
        
        DispatchQueue.main.asyncAfter(deadline: delay){
            
            withAnimation(Animation.easeOut(duration: 0.5)){
                
                self.offsets[index] = value
                
                
            }
            
        }
    }
}
