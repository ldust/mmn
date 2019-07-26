{ app, BrowserWindow } = require 'electron'

{ hello } = require './utils'

app.on 'ready', ->
    win = new BrowserWindow(
        width : 800,
        height: 800,
        webPreferences : { nodeIntegration: true }
    )
    win.loadFile 'index.html'

    win.webContents.openDevTools()

    hello()

    win.on 'closed', -> win = null

app.on 'window-all-closed', ->
    app.quit()


