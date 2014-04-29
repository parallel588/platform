module.exports = function(grunt) {
  
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    concat: {
      options: {
        separator: ";"
      },
      dist: {
        src: ['app/assets/javascripts/**/*.js'],
        dest: 'dist/<%= pkg.name %>.js'
      }
    },
    uglify: {
      option: {
        banner: '/*! <%= pkg.name %> <%= grunt.template.today("dd-mm-yyyy") %> */\n'
      },
      dist: {
        files: {
          'dist/<%= pkg.name %>.min.js': ['<%= concat.dist.dest %>']
        }
      }
    },
    jshint: {
      files: ['gruntfile.js', 'app/assets/javascripts/*.js', 'app/assets/javascripts/modules/*.js', 'app/assets/javascripts/libs/*.js'],
      options: {
        expr: true,
        curly: false,
        eqnull: true,
        browser: true,
        sub: true,
        boss: true,
        "-W053": true
      }
    },
    watch: {
      files: ['<%= jshint.files %>'],
      tasks: ['jshint']
    },
    requirejs: {
      application: {
        options: {
          baseUrl: 'app/assets/javascripts/',
          mainConfigFile: 'app/assets/javascripts/application.config.js',
          name: "application",
          out: "app/assets/javascripts/application.min.js",
          optimize: "uglify"  
        }
      },
    }
  });


  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-jshint');
  grunt.loadNpmTasks('grunt-contrib-qunit');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-contrib-requirejs');

  grunt.registerTask('default', ['watch']);
  grunt.registerTask('prod', ['requirejs:application']);

};