//
//  imageClasifier.swift
//  TestingImageClasifier
//
//  Created by Lujeen Alradhi on 16/11/1444 AH.
//

import Vision
import UIKit

struct prediction1: Identifiable {
    let id = UUID()
    let label: String
    let confidence: Float
}

class ImageClassifier: ObservableObject {
    private var model: Optional<VNCoreMLModel> = .none
    @Published var predictions: Array<prediction1> = .init()
    
    init(){
        guard let MobileNetV2 = try? PlantsClassifier10(configuration: MLModelConfiguration()) else {
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
                guard let reqobserve = requests.results as? [VNClassificationObservation] else{
                    return
                }
                
//                reqobserve.forEach{
//                    print($0)
//                }
                
               
                for observation in reqobserve {
                    let prediction = prediction1(label: observation.identifier, confidence: observation.confidence * 100)
                    predictions.append(prediction)
                }
            }
        requset.usesCPUOnly = true
            let requsestHandelr = VNImageRequestHandler(cgImage: image)
            try? requsestHandelr.perform([requset])
        }
    }
