Course = require 'models/Course'
Level = require 'models/Level'
LevelSession = require 'models/LevelSession'
ImageGalleryModal = require 'views/play/level/modal/ImageGalleryModal'
ProgressView = require 'views/play/level/modal/ProgressView'
factories = require 'test/app/factories'

describe 'ImageGalleryModal', ->
  modal = null
  
  beforeEach (done) ->
    modal = new ImageGalleryModal()
    modal.render()
    _.defer done
    
  it '(demo)', ->
    jasmine.demoModal(modal)
