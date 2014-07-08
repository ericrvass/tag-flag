# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $(".add_search_input_link").click (e) ->
    last_input = $(".html-input:last")
    new_input = last_input.clone()
    last_input.after new_input
    e.preventDefault()
    false
  $("#submit_button").click (e) ->
    $("#result").html('');
    $("#submit_button").button "loading"
    $("#search_form").submit();
    e.preventDefault()
    false
  return
