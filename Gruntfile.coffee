'use strict'
module.exports = (grunt) ->
  # Project configuration.
  grunt.initConfig
    coffeelint:
      app: [
        'bin/md2confwatcher', './index.coffee'
      ]
      gruntfile: ['./Gruntfile.coffee']
    watch:
      gruntfile:
        files: '<%= coffeelint.gruntfile %>'
        tasks: ['coffeelint:gruntfile']

      app:
        files: '<%= coffeelint.app %>'
        tasks: ['coffeelint:app']

  # These plugins provide necessary tasks.
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  # Default task.
  grunt.registerTask 'default', ['coffeelint']
