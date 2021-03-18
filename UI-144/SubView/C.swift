//
//  C.swift
//  UI-144
//
//  Created by にゃんにゃん丸 on 2021/03/14.
//

import SwiftUI

struct C: View {
    @EnvironmentObject var model : MenuViewModel
    @State var currentTime = Time(min: 0, sec: 0, hour: 0)
    @State var reciver = Timer.publish(every: 1, on: .current, in: .default).autoconnect()
    var body: some View {
        NavigationView{
            
            VStack{
                
                HStack{
                    
                    Text("Analog Clock")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.blue)
                        .padding(.top,30)
                    
                    Spacer()
                    
                    
                    Button(action: {
                        
                        withAnimation{
                            
                            model.isdark.toggle()
                        }
                    }) {
                        
                        Image(systemName: model.isdark ? "moon.fill" : "sun.min.fill")
                            .font(.system(size: 30))
                            .foregroundColor(model.isdark ? .black : .white)
                            .background(Color.primary)
                            .clipShape(Circle())
                           
                        
                    }
                    
                    
                }
                .padding()
                
                ZStack{
                    
                    Circle()
                        .fill(Color.red.opacity(0.1))
                    
                    ForEach(0..<60,id:\.self){index in
                        
                        Rectangle()
                            .fill(Color.primary)
                            .frame(width: 2, height: (index % 5) == 0 ? 15 : 5)
                            .offset(y: (getrect().width - 110) / 2)
                            .rotationEffect(.init(degrees: Double(index) * 6))
                        
                    }
                    Rectangle()
                        .fill(Color.primary)
                        .frame(width: 2, height: (getrect().width - 180) / 2)
                        .offset(y: -(getrect().width - 180) / 4)
                        .rotationEffect(.init(degrees: Double(currentTime.sec)*6))
                    
                    Rectangle()
                        .fill(Color.primary)
                        .frame(width: 4, height: (getrect().width - 200) / 2)
                        .offset(y: -(getrect().width - 200) / 4)
                        .rotationEffect(.init(degrees: Double(currentTime.min)*6))
                        
                    
                    
                    Rectangle()
                        .fill(Color.primary)
                        .frame(width: 4.5, height: (getrect().width - 240) / 2)
                        .offset(y: -(getrect().width - 240) / 4)
                        .rotationEffect(.init(degrees: (Double(currentTime.hour) + (Double(currentTime.min) / 60)) * 30))
                    
                        Circle()
                            .fill(Color.primary)
                            .frame(width: 15, height: 15)
                    
                    
                    
                    
                    
                }
                .frame(width: getrect().width - 80,height: getrect().width - 80)
                
              
                
                Text(getTime())
                    .font(.system(size: 50))
                    .bold()
                
                
                
             Spacer()
            }
            
            .navigationBarHidden(true)
           
            
          
        }
        .onAppear(perform: {
            
            let calender = Calendar.current
            let min = calender.component(.minute, from: Date())
            let sec = calender.component(.second, from: Date())
            let hour = calender.component(.hour, from: Date())
            
            
            withAnimation(Animation.linear(duration: 0.3)){
                
                self.currentTime = Time(min: min, sec: sec, hour: hour)
                
            }
            
            
            
            
        })
        .onReceive(reciver, perform: { (_) in
            let calender = Calendar.current
            let min = calender.component(.minute, from: Date())
            let sec = calender.component(.second, from: Date())
            let hour = calender.component(.hour, from: Date())
            
            
            withAnimation(Animation.linear(duration: 0.3)){
                
                self.currentTime = Time(min: min, sec: sec, hour: hour)
                
            }
        })
       
        .preferredColorScheme(model.isdark ? .dark : .light)
        
        
    }
    func getTime()->String{
        
        let format = DateFormatter()
        format.dateFormat = "hh:mm a"
        
        return format.string(from: Date())
    }
}



struct C_Previews: PreviewProvider {
    static var previews: some View {
        C()
    }
}

struct Time {
    var min : Int
    var sec : Int
    var hour : Int
}

