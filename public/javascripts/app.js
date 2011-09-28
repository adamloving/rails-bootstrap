/* DO NOT MODIFY. This file was compiled Wed, 28 Sep 2011 06:04:12 GMT from
 * /Users/adam/Projects/rails-bootstrap/app/coffeescripts/app.coffee
 */

(function() {
  var App;
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
  App = (function() {
    function App() {
      this.onSignupSuccess = __bind(this.onSignupSuccess, this);
      this.onSignupClick = __bind(this.onSignupClick, this);      console.log('hi');
      $('#signup').click(this.onSignupClick);
    }
    App.prototype.onSignupClick = function() {
      console.log('click');
      return $.ajax('/signup', {
        type: 'POST',
        dataType: 'json',
        data: {
          email: $('#email').val()
        },
        error: __bind(function(jqXHR, textStatus, errorThrown) {
          return $('.alert-message.error').text('Error: #{textStatus}');
        }, this),
        success: __bind(function(data, textStatus, jqXHR) {
          return this.onSignupSuccess(data);
        }, this)
      });
    };
    App.prototype.onSignupSuccess = function(data) {
      return $('.alert-message.success').fadeIn();
    };
    return App;
  })();
  jQuery(function() {
    return window.app = new App;
  });
}).call(this);
