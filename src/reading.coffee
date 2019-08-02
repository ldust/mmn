app = new Framework7 {
    root: '#app'
    name: 'mmn'
    id: 'fun.bluebit.mmn'
    panel: { swipe: 'left' }
    routes: [
        { path: '/about/', url: './view/about.html' }
    ]
}

mainView = app.views.create('.view-main')
