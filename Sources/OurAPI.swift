//
//  OurAPI.swift
//  IBMServer
//
//  Created by Michael Vilabrera on 6/25/17.
//
//

// from the video:
// https://www.youtube.com/watch?v=iyPibwSk85w


import Foundation
import Kitura
import SwiftyJSON

class OurAPI {
    
    var router: Router?
    
    init() {
        self.router = Router()
        router?.all(middleware: BodyParser())
    }
    
    func ourAPIRoutes() -> Router {
        
        // handle HTTP GET requests to /
        router?.get("/") {
            request, response, next in
            response.send("Hello, World! Allo Welt!")
            next()
        }
        
        // handle HTTP POST requests
        router?.post("/tryThis") {
            request, response, next in
            guard let postData = request.body else { next(); return }
            switch (postData) {
            case .json(let jsonData):
                let mark = jsonData["mark"].string ?? ""
                if mark == "VW" {
                    try response.send("The VW is in the garage").end()
                } else {
                    try response.send("Closed at night").end()
                }
            default:
                try response.send("Bad JSON").end()
            }
        }
        
        return router!
    }
}
