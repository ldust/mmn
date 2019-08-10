electron            = require 'electron'
windowStateKeeper   = require 'electron-window-state'

win = null    


openDialog = (win, evt) ->
    properties = [ 'openFile', 'openDirectory', 'multiSelections' ]
    electron.dialog.showOpenDialog win, { properties }, (paths) ->
        evt.reply 'asynchronous-reply', { type : 'open-dialog', paths }

module.exports = 
    create: ->
        return if win?

        mainWindowState = windowStateKeeper {
            defaultWidth: 800,
            defaultHeight: 600
        }


        win = new electron.BrowserWindow {
            show            : false,
            x               : mainWindowState.x,
            y               : mainWindowState.y,
            width           : mainWindowState.width,
            height          : mainWindowState.height,
            minWidth        : 320,
            minHeight       : 200,
            webPreferences  : { nodeIntegration: true }
        }

        win.loadFile 'view/index.html'

        win.on 'closed', -> win = null
        win.once 'ready-to-show', win.show

        mainWindowState.manage(win)

        electron.ipcMain.on 'asynchronous-message', (evt, arg) ->
            if arg is 'open-dialog'
                openDialog win, evt


        win