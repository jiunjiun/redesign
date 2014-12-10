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
  initialize = ->
    $('[data-toggle="tooltip"]').tooltip()

  $(document).ready(initialize)
  $(document).on('page:load', initialize)



