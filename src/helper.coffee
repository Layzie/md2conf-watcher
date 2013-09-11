###
* md2conf-watcher
* https://github.com/Layzie/md2conf-watcher
*
* Copyright (c) 2013 HIRAKI Satoru
* Licensed under the MIT license.
###
'use strict'

# File name filter using regexp
exports.filter = (pattern, fn) ->
  (filename) -> fn filename if pattern.test filename

# Return file name without suffix
exports.splitFilename = (filename) -> filename.split('.')[0]

# Return markdown2confluence command
exports.execCommand = (filename) ->
  "markdown2confluence #{filename} > #{@splitFilename filename}.wiki"

