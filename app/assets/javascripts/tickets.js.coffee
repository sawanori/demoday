# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'ajax:success', '#creteTicket', (xhr, date, status) ->　location.reload()

$(document).on 'ajax:error', '#creteTicket', (xhr, date, status) ->
  form = $('#new_ticket .modal-body')
  div = $('<div id ="creteTicketErrors" class="alert alert-danger"></div>')
  ul = $('<ul></ul>')
  data.responseJSON.messages.forEach (message, i) ->
  li = $('<li></li>').text(message)
  ul.append(li)

  if $('#creteTicketErrors')[0]
    $('#creteTicketErrors').html(ul)

  else
   div.append(ul)
   form.prevent(div)
