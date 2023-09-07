//
//  ObjectDetector.swift
//  TestObjectDetection
//
//  Created by Lujeen Alradhi on 10/11/1444 AH.
//
//object detection and image detection

import Vision
import UIKit

struct prediction: Identifiable {
    let id = UUID()
    let label: String
    let confidence: Float
    let boundingbox: CGRect

}

class ObjectDetector: ObservableObject {
    private var model: Optional<VNCoreMLModel> = .none
    @Published var predictions: Array<prediction> = .init()
    
    init(){
        guard let MobileNetV2 = try? PlantsClassifier2(configuration: MLModelConfiguration()) else {
            return
        }
        guard let coreMLModel = try? VNCoreMLModel(for: MobileNetV2.model) else {
            return
        }
        
        model = coreMLModel
    }
    
    func predict(image : UIImage){
    predictions = []
    guard let image = image.cgImage else {
    return
    }
    guard let model = model else {
    return
    }
    let requset = VNCoreMLRequest(model: model) {[self] requests, error in
    guard error == nil else {
    print(error?.localizedDescription ?? "error")
    return
    }
    guard let reqobserve = requests.results as? [VNRecognizedObjectObservation] else{
    return
    }

    // reqobserve.forEach{
    // print($0)
    // }

               print("looping through observation")
                for observation in reqobserve {
                    guard let label = observation.labels.first else {
                        return
                    }
                    let prediction = prediction(
                        label: label.identifier,
                        confidence: label.confidence ,
                        boundingbox: observation.boundingBox)
                        predictions.append(prediction)
    // print(observation.labels.first?.identifier)
    // print(observation.labels.first?.confidence)
    // print(observation.boundingBox)
    }
    }
    let requsestHandelr = VNImageRequestHandler(cgImage: image)

          //  let requsestHandelr = VNImageRequestHandler(
            try? requsestHandelr.perform([requset])
        }
    
    func predict(sampleBuffer : CVImageBuffer){
    predictions = []

            guard let model = model else {
                return
            }
            let requset = VNCoreMLRequest(model: model) {[self] requests, error in
                guard error == nil else {
                    print(error?.localizedDescription ?? "error")
                    return
                }
                guard let reqobserve = requests.results as? [VNRecognizedObjectObservation] else{
                    return
                }
    // reqobserve.forEach{
    // print($0)
    // }

               print("looping through observation")
                for observation in reqobserve {
                    guard let label = observation.labels.first else {
                        continue
                    }
                    let prediction = prediction(
                        label: label.identifier,
                        confidence: label.confidence * 100,
                        boundingbox: observation.boundingBox)
                        predictions.append(prediction)
    // print(observation.labels.first?.identifier)
    // print(observation.labels.first?.confidence)
    // print(observation.boundingBox)
    }
    }
    let requsestHandelr = VNImageRequestHandler(cvPixelBuffer: sampleBuffer)

          //  let requsestHandelr = VNImageRequestHandler(
            try? requsestHandelr.perform([requset])
    }

    
    
    }
