//
//  SplashScreenView.swift
//  SplashScreen
//
//  Created by Federico on 20/01/2022.
//

import SwiftUI

struct SplashScreenView: View {
    @State var isActive : Bool = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    // Customise your SplashScreen here
    var body: some View {
        NavigationView{
            ZStack{
                Color("Color")

                if isActive {
                ContentView()
            } else {
                // ZStack{
                VStack {
                    VStack {
                        Image("Image 3")
                            .font(.system(size: 80))
                           // .foregroundColor(.red)
                        Text("Plant")
                            .font(.largeTitle)
                            .foregroundColor(Color("Color 3"))
                            .bold()
                        //   .font(Font.custom("Baskerville-Bold", size: 26))
                        
                        //   .foregroundColor(.black.opacity(0.80))
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.2)) {
                            self.size = 0.9
                            self.opacity = 1.00
                        }
                    }
                }
                
                
                
                
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
            }
            
        }
           .background (Color.red)
            //.foregroundColor(Color("Color"))
            //.background(Color.black)
            .edgesIgnoringSafeArea(.all)
          //  .ignoresSafeArea()
    }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
