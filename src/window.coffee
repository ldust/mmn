
{ BrowserWindow } = require 'electron'

win = null

module.exports = 
    create: ->
        return if win?
        win = new BrowserWindow(
                width : 800,
                height: 800,
                webPreferences : { nodeIntegration: true }
            )
        win.loadFile 'index.html'

        win.webContents.openDevTools()

        win.on 'closed', -> win = null

        win