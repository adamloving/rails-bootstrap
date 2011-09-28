# use rake barista:brew to compile manually
class App
  
  constructor: ->
    console.log('hi')
    $('#signup').click @onSignupClick
    
  onSignupClick: () =>
    console.log('click')  
    $.ajax '/signup',
        type: 'POST'
        dataType: 'json'
        data: 
          email: $('#email').val()
        error: (jqXHR, textStatus, errorThrown) =>
            $('.alert-message.error').text('Error: #{textStatus}')            
        success: (data, textStatus, jqXHR) =>
            this.onSignupSuccess(data)
    
  onSignupSuccess: (data) =>
    $('.alert-message.success').fadeIn();

jQuery ->  
  window.app = new App