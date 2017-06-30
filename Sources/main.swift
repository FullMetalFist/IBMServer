import Kitura
import HeliumLogger

// initialize HeliumLogger
HeliumLogger.use()

// Create a new router
let api = OurAPI()

// add an HTTP server and connect it to the router
Kitura.addHTTPServer(onPort: 4040, with: api.ourAPIRoutes())

// start the Kitura runloop
Kitura.run()
