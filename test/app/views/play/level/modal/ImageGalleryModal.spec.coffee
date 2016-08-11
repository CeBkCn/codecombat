Course = require 'models/Course'
Level = require 'models/Level'
LevelSession = require 'models/LevelSession'
ImageGalleryModal = require 'views/play/level/modal/ImageGalleryModal'
ProgressView = require 'views/play/level/modal/ProgressView'
factories = require 'test/app/factories'
utils = require 'core/utils'

describe 'ImageGalleryModal', ->
  modal = null
  
  beforeEach (done) ->
    modal = new ImageGalleryModal()
    modal.render()
    _.defer done
    
  it '(demo)', ->
    jasmine.demoModal(modal)

  it 'shows a list of images', ->
    expect(modal.$('img').length).toBeGreaterThan(16)
  
  describe 'clicking an image', ->
    beforeEach (done) ->
      @clickedImage = modal.$('li:nth-child(5)').click()
      @clickedImagePath = @clickedImage.data('portrait-url')
      @clickedImageUrl = utils.pathToUrl(@clickedImagePath)
      @clickedImageTag = '<img src="' + @clickedImageUrl + '"/>'
      _.defer done

    it 'highlights the chosen image', ->
      expect(modal.$('li:nth-child(5)').hasClass('selected')).toBe(true)
      
    it 'displays the URL/image tags in the Copy section', ->
      expect(modal.$('.image-url').text()).toBe(@clickedImageUrl)
      expect(modal.$('.image-tag').text()).toBe(@clickedImageTag)
  
  describe "How to Copy/Paste section", ->
    it 'Shows Windows shortcuts to Windows users', ->
      spyOn(utils, 'userAgent').and.callFake ->
        'Mozilla/5.0 (Windows NT 6.3; Trident/7.0; rv:11.0) like Gecko'
      modal.render()
      expect(modal.$('.how-to-copy-paste').text()).toMatch(/Control/)

    it 'Shows Mac shortcuts to Mac users', ->
      spyOn(utils, 'userAgent').and.callFake ->
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36'
      modal.render()
      expect(modal.$('.how-to-copy-paste').text()).toMatch(/Control/)
      
