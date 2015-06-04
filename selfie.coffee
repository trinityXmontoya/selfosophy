if Meteor.isClient
  Template.selfie.events 'click button': ->
    MeteorCamera.getPicture([{width: 100,height: 100, quality: 100}], (err, data)->
      if err
        console.log "there was an error"
      if data
        cnv = document.getElementById("capturedPhoto")
        ctx = cnv.getContext('2d')
        photo = new Image()
        photo.src = data
        barack = new Image()
        barack.onload = ()->
          ctx.drawImage(barack,0,115.8,97.8,124.2)
        barack.src = "images/bama.png"
        ctx.drawImage(photo, 0,0, 320, 240)
    )
    return

if Meteor.isServer
  Meteor.startup ->
    # code to run on server at startup
    return


