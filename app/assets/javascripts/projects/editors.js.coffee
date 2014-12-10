# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  initialize = ->
    myTextArea = document.getElementById("project_style_attributes_stylesheet")
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


  $(document).ready(initialize)
  $(document).on('page:load', initialize)