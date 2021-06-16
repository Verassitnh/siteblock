const fs = require("fs")
const path = require("path")
let blocksites = ""

const files = fs.readdirSync(path.resolve(__dirname, "../blocklists"))


for (let x in files) {
 blocksites += fs.readFileSync(path.resolve(__dirname, "../blocklists/", files[x]), 'utf-8')
}

fs.writeFileSync('/etc/hosts.blacklist', blocksites)
