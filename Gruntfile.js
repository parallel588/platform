module.exports = function(grunt) {
  
  grunt.initConfig({
    svgstore: {
      options: {
        prefix : 'icon-', // This will prefix each ID
        svg: { // will be added as attributes to the resulting SVG
          viewBox : '0 0 100 100',
          style: 'display: none;'
        },
        cleanup : ['style', 'fill'],
        formatting: {
          indent_inner_html: true,
          indent_size: 2,
          good_stuff: true
        }
      },
      default: {
        files: {
          'app/assets/images/icons.svg': ['app/assets/images/icons/*.svg']
        }
      },
    }
  });

  grunt.loadNpmTasks('grunt-svgstore');

  grunt.registerTask('icons', ['svgstore']);

};