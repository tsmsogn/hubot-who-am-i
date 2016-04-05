expect = require('chai').expect
path   = require 'path'

Robot       = require 'hubot/src/robot'
TextMessage = require('hubot/src/message').TextMessage

describe 'who-am-i', ->
  robot = {}
  user = {}
  adapter = {}

  beforeEach (done) ->
    robot = new Robot null, 'mock-adapter', false

    robot.adapter.on 'connected', ->

      require('../src/who-am-i')(robot)

      user = robot.brain.userForId '523号', {
        name: 'フーアムアイ'
      }

      adapter = robot.adapter

      done()

    robot.run()

  afterEach ->
    robot.shutdown()

  it 'responds when asked, "who am i?"', (done) ->
    adapter.on 'reply', (envelope, strings) ->
      expect(strings[0]).to.match /フーアムアイ/
      expect(strings[0]).to.match /523号/
      done()

    adapter.receive(new TextMessage user, 'hubot: who am i?')

  it 'responds when asked, "WHO AM I?"', (done) ->
    adapter.on 'reply', (envelope, strings) ->
      expect(strings[0]).to.match /フーアムアイ/
      expect(strings[0]).to.match /523号/
      done()

    adapter.receive(new TextMessage user, 'hubot: WHO AM I?')
