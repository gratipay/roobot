module.exports = (grunt) ->
  grunt.initConfig
    release:
      options:
        tagType: "signed"
        tagName: "v<%= version %>"
        commitMessage: "Prepare for release v<%= version %>"
        tagMessage: "Annotated tag v<%= version %>"

  grunt.loadNpmTasks 'grunt-release'
