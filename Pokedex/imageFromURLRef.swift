////
////  imageFromURLRef.swift
////  Pokedex
////
////  Created by Annie Tang on 9/18/17.
////  Copyright © 2017 trainingprogram. All rights reserved.
////
//
//import Foundation
///** code retrieved from: https://stackoverflow.com/questions/39813497/swift-3-display-image-from-url **/
//let pokemonImageURL = URL(string: p.imageUrl)!
//
//// Creating a session object with the default configuration.
//// Read more about it here https://developer.apple.com/reference/foundation/urlsessionconfiguration
//let session = URLSession(configuration: .default)
//
//// Define a download task. The download task will download the contents of the URL as a Data object and then you can do what you wish with that data.
//let downloadPicTask = session.dataTask(with: pokemonImageURL) { (data, response, error) in
//    // The download has finished.
//    if let e = error {
//        print("Error downloading pokemon picture: \(e)")
//        let image = UIImage()
//    } else {
//        // No errors found.
//        // It would be weird if we didn't have a response, so check for that too.
//        if let res = response as? HTTPURLResponse {
//            print("Downloaded pokemon picture with response code \(res.statusCode)")
//            if let imageData = data {
//                // Finally convert that Data into an image and do what you wish with it.
//                let image = UIImage(data: imageData)
//                // Do something with your image.
//            } else {
//                let image = UIImage("")
//            }
//        } else {
//            print("Couldn't get response code for some reason")
//        }
//    }
//}
//
//downloadPicTask.resume()
//}
//
