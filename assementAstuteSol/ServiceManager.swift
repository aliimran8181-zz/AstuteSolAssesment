//
//  ServiceManager.swift
//  assementAstuteSol
//
//  Created by Ali on 08/01/2022.
//
import Foundation
import UIKit

class ServiceManager{
var Arr = [images]()

func loadData( completed: @escaping([images]) -> ()) -> Void{

    let request = NSMutableURLRequest(url: NSURL(string: "https://blogswizards.com/mobile_app_assignment/api/get_all_photos")! as URL,
                                            cachePolicy: .useProtocolCachePolicy,
                                        timeoutInterval: 10.0)
    request.httpMethod = "GET"

    let session = URLSession.shared
    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
          if let myData = data {
             // print(myData)
              if let json = try? JSONSerialization.jsonObject(with: myData, options: []) as? NSDictionary {
                  if let dataRes = json.object(forKey: "data") as? NSArray
                  {
                   //   print(dataRes)
                      
                      self.Arr = self.parsedata(responseArr: dataRes) as! [images]
                  }
                 // print(self.Arr.count)
                   DispatchQueue.main.async {
                       completed(self.Arr)
                  }
              }
              
              else {
                  print("Error");
              }
          }
        //print(error)
     
    })

    dataTask.resume()
}

//MARK: PARSING DATA INTO ARRAY
 func parsedata(responseArr:NSArray) -> NSMutableArray
   {
       let placesArr:NSMutableArray = NSMutableArray()
       
       for places in responseArr
       {
           if let placesDict = places as? NSDictionary
           {
               let placesObj = images(dictionary: placesDict)
               placesArr.add(placesObj!)
           }
       }
       
       return placesArr
   }
}
