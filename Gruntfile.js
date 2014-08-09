module.exports = function(grunt) {
  
  grunt.initConfig({
    svgstore: {
      options: {
        prefix : 'icon-', // This will prefix each ID
        svg: { // will be added as attributes to the resulting SVG
          viewBox : '0 0 100 100'
        }
      },
      your_target: {
        'dest/dest.svg': ['svgs/*.svg'],
      },
    },
  });


  grunt.loadNpmTasks('grunt-svgstore');

  grunt.registerTask('default', ['svgstore']);

};