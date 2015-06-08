module.exports = (grunt)->

  grunt.initConfig {}=
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
    connect:
      server:
        options:
          port: 8008
          hostname: '*'
          base: 'dist'
          livereload: true
          keepalive: true
    watch:
      options:
        livereload: true
      taskName:
        files: [
          "dist/javascript/*.js"
          "dist/stylesheet/*.css"
          "dist/*.html"
        ]
      coffee:
        files: 'src/javascript/**/*.coffee'
        tasks: 'coffee'
      haml:
        files: 'src/**/*.haml'
        tasks: 'haml'
      compass:
        files: 'src/stylesheet/**/*.scss'
        tasks: 'compass'

  grunt.loadNpmTasks('grunt-haml2html')
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-compass')
  grunt.loadNpmTasks('grunt-contrib-connect')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.registerTask('default',['haml','coffee','compass'])
