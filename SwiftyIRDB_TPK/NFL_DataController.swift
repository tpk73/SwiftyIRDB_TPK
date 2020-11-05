//
//  IRDb_DataController.swift
//  SwiftyIRDB_TPK
//
//  Created by Tanner Parker on 10/22/20.
//  Changes were made

import UIKit

class NFL_DataController: NSObject {
    
    let JSONURL = "https://api.jsonbin.io/b/5fa35a66a03d4a3bab0ced86"
    
    var dataModel: IRDb_MediaDataModel?
    
    func getJSONData(completion: @escaping (_ dataModel: IRDb_MediaDataModel)->()) {
        
        let jsonURL = URL(string: JSONURL)
        
        let dataTask = URLSession.shared.dataTask(with: jsonURL!) {
            
            (data, response, error) in
            
            guard let thisData = data else{
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let thisMediaData = try decoder.decode(IRDb_MediaDataModel.self, from: thisData)
                
                self.dataModel = thisMediaData
                //print(thisMediaData.franchise[0].entries[0].summary)
            }
            catch let err {
                print("Error Was: ", err)
            }
            // call back the completionHandler and let them know we are done
            
            //go back to the main thread
            DispatchQueue.main.async{
                // gg in the chat
                completion(self.dataModel!)
            }
        }
        dataTask.resume()
    }
}
