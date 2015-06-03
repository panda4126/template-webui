module.exports = (grunt)->

  grunt.initConfig {
    haml:
      dist:
        options:
          bundleExec: true
          style: 'expanded'
        files: [{
          expand: true
          cwd: 'src/'
          src: ['**/*.haml']
          dest: 'dist/'
          ext: '.html'
        }]
  }

  grunt.loadNpmTasks('grunt-haml2html')
  grunt.registerTask('default',['haml'])
