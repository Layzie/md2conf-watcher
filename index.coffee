###
* md2conf-watcher
* https://github.com/Layzie/md2conf-watcher
*
* Copyright (c) 2013 HIRAKI Satoru
* Licensed under the MIT license.
###
'use strict'

fs = require 'fs'
exec = require('child_process').exec

watch = require 'node-watch'
argv = require('optimist')
  .usage('Usage: $0 -d [directory]')
  .demand(['d'])
  .options('d',
    alias: 'dir'
    describe: 'directory want to watch files'
    demand: true
  )
  .argv

helper = require './src/helper'

filterReg = /\.md$|\.markdown$/

# Judge existance of file/directory refred argv options
fs.exists argv.d, (exists) ->
  if exists
    watch(argv.d, helper.filter(filterReg, (filename) ->
      console.log filename, ' changed.'

      exec(helper.execCommand(filename), (err, stdout, stderr) ->
          throw new Error('Error!') if err

          console.log stdout
          console.log stderr
          console.log "#{helper.splitFilename filename}.wiki is created."
      )
    ))
  else
    console.log 'File or directory is not exist.'
    process.exit 1
