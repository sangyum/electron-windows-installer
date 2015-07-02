fs = require 'fs'
assert = require 'assert'
electronInstaller = require '../dist'

describe 'create-windows-installer task', ->
  beforeEach ->
    updateExePath = './fixtures/app/Update.exe'
    fs.unlinkSync updateExePath if fs.existsSync updateExePath

  it 'creates a nuget package and installer', (done) ->
    electronInstaller
      appDirectory: './test/fixtures/app'
      outputDirectory: './build'
      description: 'Default app.'
      authors: 'GitHub Inc.'
      version: '1.0.0'
      iconUrl: 'https://raw.githubusercontent.com/Aluxian/electron-installer/master/resources/icon.png'
    .then ->
      assert.equal true, fs.existsSync('./test/fixtures/app/Update.exe')
      assert.equal true, fs.existsSync('./build/electron-1.0.0-full.nupkg')
      assert.equal true, fs.existsSync('./build/ElectronSetup.exe')
    .then done
    .catch done
