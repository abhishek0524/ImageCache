//
//  ApiRequest.swift
//  ImageLoad
//
//  Created by apple on 16/04/24.
//

import Foundation

struct ApiRequest
{
    func getApiReq(completionHandler: @escaping ([ApiResponse]?) -> ()) {

        let animalApiUrl = URL(string: "https://api.unsplash.com/photos/?client_id=sh3Xbg_Ey7POF9fBP4jZuj-6r1kEPOiCWojT8erknG8")!

        URLSession.shared.dataTask(with: animalApiUrl) { (data, response, error) in

            if(error == nil && data != nil)
            {
                do {
                    let result = try JSONDecoder().decode([ApiResponse].self, from: data!)

                    completionHandler(result)

                } catch let error {
                    debugPrint(error)
                }
            }

        }.resume()


    }
}
