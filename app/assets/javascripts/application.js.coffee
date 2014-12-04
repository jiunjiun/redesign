# // This is a manifest file that'll be compiled into application.js, which will include all the files
# // listed below.
# //
# // Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# // or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
# //
# // It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# // compiled file.
# //
# // Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
# // about supported directives.

#
#                        _oo0oo_
#                       o8888888o
#                       88" . "88
#                       (| -_- |)
#                       0\  =  /0
#                     ___/`---'\___
#                   .' \\|     |// '.
#                  / \\|||  :  |||// \
#                 / _||||| -:- |||||- \
#                |   | \\\  -  /// |   |
#                | \_|  ''\---/''  |_/ |
#                \  .-\__  '-'  ___/-. /
#              ___'. .'  /--.--\  `. .'___
#           ."" '<  `.___\_<|>_/___.' >' "".
#          | | :  `- \`.;`\ _ /`;.`/ - ` : | |
#          \  \ `_.   \_ __\ /__ _/   .-` /  /
#      =====`-.____`.___ \_____/___.-`___.-'=====
#                        `=---='
#
#      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
#                佛祖保佑         永無BUG
#
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
# require PixelAdmin/pixel-admin
//= require codemirror


//= require codemirror/keymaps/sublime
//= require codemirror/modes/css

//= require codemirror/addons/fold/foldcode
//= require codemirror/addons/fold/brace-fold
//= require codemirror/addons/fold/brace-fold
//= require codemirror/addons/lint/css-lint
//= require codemirror/addons/lint/lint
//= require_tree .

$ ->
  init = []
  $('[data-toggle="tooltip"]').tooltip()

  $("input#css_link").on "click", ->
    $(this).select()
    return

  initialize = ->
    myTextArea = document.getElementById("project_stylesheet")
    if myTextArea
      myCodeMirror = CodeMirror.fromTextArea(myTextArea,
        mode        : "css"
        theme       : "monokai"
        lineNumbers : true
        lineWrapping: true
        tabSize     : 2
        tabindex    : 0
        lint        : true
        keyMap      : "sublime"

        gutters: [
          "CodeMirror-lint-markers"
          "CodeMirror-linenumbers"
          "CodeMirror-foldgutter"
        ]
      )

    $(".code").each ->
      code = $("#css_code").val()
      $('.hide').remove()
      CodeMirror this,
        readOnly   : true
        value      : code

        mode        : "css"
        # theme       : "monokai"
        lineNumbers : true
        lineWrapping: true
        tabSize     : 2
        tabindex    : 0
        keyMap      : "sublime"

      return

  $(document).ready(initialize)
  $(document).on('page:load', initialize)



