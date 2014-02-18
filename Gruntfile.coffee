module.exports = (grunt) ->
  grunt.initConfig
    release:
      options:
        tagName: "v<%= version %>"
        commitMessage: "Prepare for release v<%= version %>"
        tagMessage: "Annotated tag v<%= version %>"

  grunt.loadNpmTasks 'grunt-release'
