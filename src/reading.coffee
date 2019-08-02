
pageInit = ->
    console.info 'page init'


app = new Framework7 {
    root: '#app'
    name: 'mmn'
    id: 'fun.bluebit.mmn'
    on: { pageInit }
}

app.views.create('.view-main')