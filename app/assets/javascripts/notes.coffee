# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->
  $("#note_date").datepicker({ dateFormat: "yy-mm-dd"}).datepicker("setDate", new Date());
#$('#animal_food_current_date').datepicker
#  dateFormat: 'yy-mm-dd'
jQuery ->
  $('#animal_food_time').timepicker()
