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
    coffee:
      options:
        header: true
      dist:
        expand: true
        cwd: 'src/javascript'
        src: ['**/*.coffee']
        dest: 'dist/javascript/'
        ext: '.js'
    compass:
      options:
        config: 'src/stylesheet/config.rb'
      dist:
        expand: true
        cwd: 'src/stylesheet'
        src: ['**/*.scss']
        dest: 'dist/stylesheet'
        ext: '.css'
  }

  grunt.loadNpmTasks('grunt-haml2html')
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-compass')
  grunt.registerTask('default',['haml','coffee','compass'])
