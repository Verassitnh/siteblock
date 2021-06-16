// Require the framework and instantiate it
const app = require("fastify")({logger: true})
const fs = require("fs")

const html = fs.readFileSync(`${__dirname}/static/index.html`, 'utf-8')

  // Declare a route
  app.get('/', function (request, reply) {
    reply.header("Content-type", "text/html")
    reply.send(html)
  })
  
  
  // Run the server!
module.exports.start = function start() {
   app.listen(3000, function (err, address) {
    if (err) {
      fastify.log.error(err)
      process.exit(1)
    }
    app.log.info(`server listening on ${address}`)
  })    
  }
