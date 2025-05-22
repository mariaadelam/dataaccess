// server.js
 
const WebSocket = require('ws') // Importa biblioteca WebSocket
 
const wss = new WebSocket.Server({ port: 8080 }) // Creaza un server WebSocket pe portul 8080
 
wss.on('connection', ws => {
  ws.on('message', message => {
    console.log(`Received message => ${message}`)
  })
  ws.send('Hello! Mesaj trimis de la server!')
})