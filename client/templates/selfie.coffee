Template.selfie.events
  'click button#snap-photo': ->
    MeteorCamera.getPicture([{width: 100,height: 100, quality: 100}], (err, data)->
      if err
        console.log "there was an error"
      if data
        cnv = document.createElement('canvas')
        cnv.width = 320
        cnv.height = 240
        ctx = cnv.getContext('2d')
        photo = new Image()
        photo.src = data
        barack = new Image()
        barack.onload = ()->
          ctx.drawImage(barack,0,115.8,97.8,124.2)
          Session.set('currentImage', cnv.toDataURL("img/png"))
        barack.src = "images/bama.png"
        ctx.drawImage(photo, 0,0, 320, 240)
    )

  'click button#add-to-gallery': ->
    img = Session.get('currentImage')
    Submissions.insert({
      src: img
    })
    Session.set('currentImage', null)

Template.selfie.helpers
  currentImage: ()->
    return Session.get('currentImage')
