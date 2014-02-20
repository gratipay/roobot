module.exports = (grunt) ->
  grunt.initConfig
    release:
      options:
        tagName: "v<%= version %>"
        commitMessage: "Prepare for release v<%= version %>"
        tagMessage: "Annotated tag v<%= version %>"
        npm: false
        npmtag: false

  grunt.loadNpmTasks 'grunt-release'
