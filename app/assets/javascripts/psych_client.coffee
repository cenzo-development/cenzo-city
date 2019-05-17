# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

  $("#houseNumber").change ->
    verify_address() if $('#postCode').val() != ''

  $("#postCode").change ->
    verify_address() if $('#houseNumber').val() != ''


verify_address = () ->
  num = $('#houseNumber').val()
  code = $('#postCode').val()
  if !either_number_postcode_empty(num, code)
    check_address(code, num)


either_number_postcode_empty = (number, postcode) ->
  number_empty = not number? or number is ''
  postcode_empty = not postcode? or postcode is ''
  either_empty = number_empty or postcode_empty


check_address = (postcode, number) ->
    settings =
      'cache': false
      'url': '/misc/address'
      'data':
        'postcode': postcode
        'number': number
      'method': 'GET'
      'headers':
        'accept': "json"

    $.ajax(settings).done (response) ->

      try
        if response?
          document.getElementById("address").disabled = false
          document.getElementById("place").disabled = false
          if response._embedded? and response._embedded.addresses?
            city = response._embedded.addresses[0].city.label
            street = response._embedded.addresses[0].nen5825.street
            $("#address").val(street)
            $('#place').val(city)

        if response.error?
          alert("Serverfout: momenteel kan het huisnummer en de postcode combinatie niet worden geverifieerd")

      catch error
        alert "Waarschuwing: huisnummer en postcode combinatie zijn ongeldig"
