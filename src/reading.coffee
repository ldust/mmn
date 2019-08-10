$$ = Dom7
electron = require('electron')

pageInit = ->
    $$ "#mmnopen"
    .on 'click', ->
        electron.ipcRenderer.on 'asynchronous-reply', (evt, arg) ->
            if arg.type is 'open-dialog'
                console.log arg.paths
        electron.ipcRenderer.send 'asynchronous-message', 'open-dialog'

app = new Framework7 {
    root: '#app'
    name: 'mmn'
    id: 'fun.bluebit.mmn'
    on: { pageInit }
}

app.views.create('.view-main')