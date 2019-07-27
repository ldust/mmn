{ app } = require 'electron'

window = require './window'

app.on 'ready', ->
    window.create()

app.on 'window-all-closed', ->
    app.quit() unless process.platform is "darwin"

app.on 'activate', ->
    window.create()
    
