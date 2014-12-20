module.exports = (grunt) ->
 
    # configuration
    grunt.initConfig

        notify_hooks:
            options:
                enabled: true
                title: "jon.goodnow.io"
                success: false

        notify:
            sass:
                options:
                    title: "jon.goodnow.io"
                    message: "SASS compiled"
            coffee:
                options:
                    title: "jon.goodnow.io"
                    message: "coffeescript compiled"
     
        # grunt sass
        sass:
            compile:
                options:
                    style: 'expanded'
                files: [
                    expand: true
                    cwd: 'sass'
                    src: ['*.scss']
                    dest: 'css'
                    ext: '.css'
                ]
         
        # grunt coffee
        coffee:
            compile:
                expand: true
                flatten: true
                cwd: 'coffee'
                src: ['*.coffee']
                dest: 'js'
                ext: '.js'
         
        # grunt watch (or simply grunt)
        watch:
            html:
                files: ['**/*.html']
            sass:
                files: ['**/*.scss']
                tasks: ['sass']
            coffee:
                files: ['**/*.coffee']
                tasks: ['coffee']
            options:
                livereload: true
 
    # load plugins
    grunt.loadNpmTasks 'grunt-notify'
    grunt.loadNpmTasks 'grunt-contrib-sass'
    grunt.loadNpmTasks 'grunt-contrib-coffee'
    grunt.loadNpmTasks 'grunt-contrib-watch'
     
    # tasks
    grunt.task.run 'notify_hooks'
    grunt.registerTask 'default', ['sass', 'coffee', 'watch'] 