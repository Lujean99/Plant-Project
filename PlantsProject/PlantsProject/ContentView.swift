//
//  ContentView.swift
//  PlantsProject
//
//  Created by Lujeen Alradhi on 16/11/1444 AH.
//

import SwiftUI

struct ContentView: View {
    @State private var useLargeTitle = false
    
    @State private var showImagePicker: Bool = false
    @State private var selectedUIimage: Optional<UIImage> = .none
    @StateObject private var ImageClassifier: ImageClassifier = .init()
    
    var body: some View {
        NavigationView{
            ZStack {
                Image("Image 2")
            //    Color.green

                VStack {
                    Spacer()
                    Spacer()
                    Spacer()
                    Text("Test Your Leaf")
                        .font(.system(size: 33))
    .font(useLargeTitle ? .largeTitle : .body)
   .fontWeight(useLargeTitle ? .ultraLight : .black)
//   .font(.system(size: 100))
                      //  .font(.largeTitle)
                        .foregroundColor(Color("Color 3"))
                      //  .bold()
                    
                    Spacer()
                    if let selectedImage = selectedUIimage{
                        
                        VStack{

                            VStack{
                                Image(uiImage: selectedImage)
                                    .resizable()
                                    .frame(width: 340, height: 370)
                                    .cornerRadius(25)
                                //     .padding(.top, 100)
                            }
                        }
                    }
                    else {
                       // NavigationView{
                        VStack{
                           // Image("fram4")
                              //  .resizable()
                              // Text("choose from library")

                        } .frame(width: 340, height: 370)
                            .background(.ultraThinMaterial)
                        .cornerRadius(25)
                       

                    }
//Spacer()
                    VStack(alignment: .leading){
                        Text("Prediction Result")
                            .font(.system(size: 33))
                            .font(.headline)
                            .foregroundColor(Color("Color 3"))
                        ForEach(ImageClassifier.predictions){ predications in
                            //predict
                            HStack{
                                Text(predications.label)
                                Text(predications.confidence.description)
                            }
                        }
                    }
                    .frame(width: 340, height: 170)
                  //  .background(Color("Color 1"))
                    .background(.ultraThinMaterial)
                    .cornerRadius(25)
                 //   .padding(.top, 100.0)
                    
                    Spacer()
                    
                    HStack(alignment: .bottom) {
                        //Color 3
                        Button(
                            action: {
                                showImagePicker.toggle()
                            },
                            label: {
                                Image(systemName: "photo.fill.on.rectangle.fill")
                                    .resizable()
                                  //  .scaledToFill()
                                    .foregroundColor(Color("Color 1"))
                                    .frame(width: 40,height: 40)
                                    .padding()
                            }
                        )
                        //.buttonStyle(.bordered)
                        .frame(width: 100, height: 70)
                        .background(Color("Color 5"))
                        .cornerRadius(25)
                        //    .buttonBorderShape(.roundedRectangle(radius: 30))
                         // .padding(40)

                    }
                 //   .padding(.top, 40)
                    Spacer()

                }
                
                .sheet(isPresented: $showImagePicker
                       ,onDismiss: {
                    guard let selectedImage = selectedUIimage else {
                        return
                    }
                    ImageClassifier.predict(image: selectedImage)
                },
                       content: {
                    imagePicker(image: $selectedUIimage)

                })
             //   .padding(.bottom,10)
            }
            .edgesIgnoringSafeArea(.all)
            

            //.ignoresSafeArea(.all)

//            .sheet(isPresented: $showImagePicker
//                   ,onDismiss: {
//                guard let selectedImage = selectedUIimage else {
//                    return
//                }
//                ImageClassifier.predict(image: selectedImage)
//            },
//                   content: {
//                imagePicker(image: $selectedUIimage)
//
//            })
//            .padding(.bottom,10)
            
            
            }
        
        
        
        
    
        //VStack{
        //  if let selectedUIimage = selectedUIimage{
        //  Image(uiImage: selectedUIimage)
        //  .resizable()
        //  .scaledToFit()
        // }
        //     Button {
        //// print("im clicked")
        //      showImagePicker.toggle()
        //      } label: {
        //    Text("click me")
        //  }
        //
        //        ScrollView{
        //            ForEach(ImageClassifier.predictions){ prediction in
        //                HStack {
        //                    Text(prediction.label)
        //                    Text(prediction.confidence.description)
        //                }
        //            }
        //        }
        //
        //    }
        //
        //    .sheet(isPresented: $showImagePicker
        //    ,onDismiss: {
        //    guard let selectedImage = selectedUIimage else {
        //    return
        //    }
        //        ImageClassifier.predict(image: selectedImage)
        //    },
        //    content: {
        //    imagePicker(image: $selectedUIimage)
        //
        //        })
        //
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



///////old code
///import SwiftUI

//struct ContentView: View {
//    @State private var showImagePicker: Bool = false
//    @State private var selectedUIimage: Optional<UIImage> = .none
//    @StateObject private var ImageClassifier: ImageClassifier = .init()
//    var body: some View {
//        NavigationView{
//
//            ZStack {
//                Color.green
//
//                VStack {
//
//
//                    if let selectedImage = selectedUIimage{
//                        VStack{
//
//                            Image(uiImage: selectedImage)
//                                .resizable()
//                                .frame(width: 360, height: 370)
//                                .cornerRadius(25)
//                                .padding(.top, 100)
//
//                            VStack(alignment: .leading){
//                                Text("Prediction Result")
//                                    .font(.headline).padding(.bottom, 50)
//                                ForEach(ImageClassifier.predictions){ predications in
//                                    //predict
//                                    HStack{
//                                        // Text("Prediction Result")
//                                        //.font(.headline).padding(.bottom, 100.0)
//                                        Text(predications.label)
//                                        Text(predications.confidence.description)
//                                    }
//                                }
//                            }
//                            .frame(width: 360, height: 170)
//                            .background(.ultraThinMaterial)
//                            .cornerRadius(25)
//                            .padding(.bottom, 140)
//                        }
//                    }
////                    else {
////                        VStack{
////                            Image("placeholder")
////                                .resizable()
//////                                .scaledToFit()
////                                .frame(width: 360, height: 370)
////                                .cornerRadius(25)
////                                .padding(.top, 100)
////                            Spacer()
////                            VStack{Text("Prediction Result").font(.headline).padding(.bottom, 100.0)}
////                                .frame(width: 360, height: 170)
////                                .background(.ultraThinMaterial)
////                                .cornerRadius(25)
////                                .padding(.bottom, 140)
////
////                        }
////
////                    }
//
//
//                }
//                //.padding(.bottom, 10)
////                  Spacer()
//                HStack(alignment: .bottom) {
//                    //  VStack(alignment: .leading){
//                    Button(
//                        action: {
//                            showImagePicker.toggle()
//                        },
//                        label: {
//                            Image(systemName: "photo.fill.on.rectangle.fill")
//                                .resizable()
//                                .frame(width: 40,height: 40)
//                                .padding()
//                        }
//                    ).buttonStyle(.bordered)
//                        .buttonBorderShape(.roundedRectangle(radius: 30))
//                        .padding(40)
//                    //     }
//                    //                        .padding([.top, .trailing], 273.0)
//                    //                        .padding([.top], 250.0)
//
//                    //  Spacer()
//                    //   VStack(alignment: .trailing){
//                    //                            Button(
//                    //                                action: {
//                    //                                    showImagePicker.toggle()
//                    //                                },
//                    //                                label: {
//                    //                                    Image(systemName: "camera")
//                    //                                        .resizable()
//                    //                                        .frame(width: 30,height: 30)
//                    //                                        .padding()
//                    //                                }
//                    //                            ).buttonStyle(.bordered)
//                    //                                .buttonBorderShape(.roundedRectangle(radius: 30))
//                    //                                .padding(40)
//                    //}
//
//                }
////                .padding(.top, 650.0)
//
//
//            }
//            .edgesIgnoringSafeArea(.all)
//
//            //.frame(width: .infinity,height: .infinity)
//            //        .ignoresSafeArea()
//            //        .background(.blue)
//            //
//
//
//            //                .frame(width: .infinity, height: .infinity).toolbar {
//            //                    ToolbarItem(placement: .bottomBar) {
//            //
//            //                        Button(
//            //                             action: {
//            //                                 showImagePicker.toggle()
//            //                            },
//            //                        label: {
//            //                            Image(systemName: "camera")
//            //                                .resizable()
//            //                                .frame(width: 30,height: 30)
//            //                                .padding()
//            //                        }
//            //                        ).buttonStyle(.bordered)
//            //                            .buttonBorderShape(.roundedRectangle(radius: 12))
//            //                          //  .padding()
//            //                          //  .frame(width: 250,height: 250)
//            //
//            //
//            //                    }
//            //
//            ////                    ToolbarItem(placement: .bottomBar) {
//            ////
//            ////                        Button(
//            ////                             action: {
//            ////                                 //showImagePicker.toggle()
//            ////                            },
//            ////                        label: {
//            ////                            Image(systemName: "photo.fill.on.rectangle.fill")
//            ////                        })
//            ////
//            ////
//            ////                    }
//            //                }
//            //.ignoresSafeArea(.all)
//
//            .sheet(isPresented: $showImagePicker
//                   ,onDismiss: {
//                guard let selectedImage = selectedUIimage else {
//                    return
//                }
//                ImageClassifier.predict(image: selectedImage)
//            },
//                   content: {
//                imagePicker(image: $selectedUIimage)
//
//            })
//            .padding(.bottom,10)
//        }
//
//        //VStack{
//        //  if let selectedUIimage = selectedUIimage{
//        //  Image(uiImage: selectedUIimage)
//        //  .resizable()
//        //  .scaledToFit()
//        // }
//        //     Button {
//        //// print("im clicked")
//        //      showImagePicker.toggle()
//        //      } label: {
//        //    Text("click me")
//        //  }
//        //
//        //        ScrollView{
//        //            ForEach(ImageClassifier.predictions){ prediction in
//        //                HStack {
//        //                    Text(prediction.label)
//        //                    Text(prediction.confidence.description)
//        //                }
//        //            }
//        //        }
//        //
//        //    }
//        //
//        //    .sheet(isPresented: $showImagePicker
//        //    ,onDismiss: {
//        //    guard let selectedImage = selectedUIimage else {
//        //    return
//        //    }
//        //        ImageClassifier.predict(image: selectedImage)
//        //    },
//        //    content: {
//        //    imagePicker(image: $selectedUIimage)
//        //
//        //        })
//        //
//
//
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}





////roba
//var body: some View {
//NavigationView{
//
//
//ZStack {
////MARK: Selected image view
//if let selectedImage = selectedUIimage{
//
//                        VStack{
//                            //  Spacer()
//                              VStack(alignment: .leading){
//
//                                  Text("Prediction")
//                                      .font(.system(size: 24))
//                                      .font(.headline)
//                                      .fontWeight(.bold)
//                                      .padding([.top, .bottom, .trailing])
//
//                                  ForEach(ImageClassifier.predictions){ predications in
//
//                                      HStack{
//                                          Text(predications.label)
//                                              .multilineTextAlignment(.leading)
//
//                                              Spacer()
//                                             // .padding()
//
//                                          Text(predications.confidence.description)
//                                          Text("%")
//                                          //    .padding()
//
//                                      }
//                                      .padding(.top, 5)
//                                      .frame(width: 320, alignment: .trailing)
//
//                                  }
//
//
//                              }.padding()
//                                  .background(
//                                      .ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16)
//                                  )
//
//                            Image(uiImage: selectedImage).resizable()
//                                .scaledToFit()
//                               // .ignoresSafeArea()
//                                .cornerRadius(25)
//                            .frame(width: 350,height: 400)
//                            .padding()
//
//                              // .frame(width: .infinity, height: .infinity)
//
//
//
//                                Spacer()
//
//
//                        }
//
//                    }
//    else {
//    //MARK: Start view
//    NavigationView{
//    VStack{
//
//                                    Spacer()
//                                    Text("Discover the birds types!")
//                                        .font(.system(size: 24))
//                                        .font(.headline)
//                                        .fontWeight(.bold)
//                                        .padding()
//                                    Text("Press + To try it now")
//                                        .font(.system(size: 24))
//                                        .font(.headline)
//
//                                    ZStack{
//
//                                        Image("mainBG2")
//                                            .resizable()
//                                            .scaledToFit()
//
//                                        Image("arrow-with-scribble")
//                                            .resizable()
//                                            .frame(width: 80,height: 80)
//                                        //   .padding(.top,200)
//                                        //  .scaledToFit()
//                                            .offset(x: 60,y: -20)
//                                    }
//
//                                }
//                                .ignoresSafeArea()
//                                .navigationTitle("Birds Classifier")
//
//                            }
//
//                        }
//
//
//
//                        Menu {
//                            Button {
//                                showImagePicker.toggle()
//
//                            } label: {
//                                Text("Photo Library")
//                                Image(systemName: "photo")
//                            }
//                            Button {
//                                // CameraView(capturedOutput: (CVImageBuffer) -> ())
//                                } label: {
//                                Text("Camera")
//                                Image(systemName: "camera")
//                                }
//                                } label: {
//                                if let selectedImage = selectedUIimage {
//                                Image(systemName: "plus")
//                                .resizable()
//                                .frame(width: 32,height: 32)
//                                .padding()
//                                .background(.black)
//                                .foregroundColor(.white)
//                                .clipShape(Circle())
//                                }
//
//                                Roba AlghanmiWed 11:53pm
//                                replyinsert_emoticon
//                                more_vert
//                                else {
//                                Image(systemName: "plus")
//                                .resizable()
//                                .frame(width: 32,height: 32)
//                                .padding()
//                                .background(.black)
//                                .foregroundColor(.white)
//                                .clipShape(Circle())
//                                }
//                                }
//                                .padding([.top, .leading], 250.0)
//                                .padding(.top, 300.0)
//
//                                                }
//
//                                                .sheet(isPresented: $showImagePicker
//                                                       ,onDismiss: {
//                                                    guard let selectedImage = selectedUIimage else {
//                                                        return
//                                                    }
//                                                    ImageClassifier.predict(image: selectedImage)
//                                                },
//                                                content: {
//                                                    imagePicker(image: $selectedUIimage)
//
//
//                                                })
//
//                                              //  .padding(.bottom,10)
//                                            } }
