
onLoad = ->
    param = { }
    param.properties = ['openFile', 'openDirectory', 'multiSelections']
    electron.dialog.showOpenDialog param, (files) ->
        console.log files
