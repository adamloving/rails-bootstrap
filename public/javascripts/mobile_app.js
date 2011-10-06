/* DO NOT MODIFY. This file was compiled Thu, 06 Oct 2011 07:03:33 GMT from
 * /Users/adam/Projects/rails-bootstrap/app/coffeescripts/mobile_app.coffee
 */

(function() {
  var App;
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
  App = (function() {
    function App() {
      this.launch = __bind(this.launch, this);      new Ext.Application({
        launch: this.launch
      });
    }
    App.prototype.launch = function() {
      var tabs, toolbar;
      tabs = [
        {
          title: 'Tab 1',
          html: '<div id="main-panel">Click my buttons!</div>',
          cls: 'card1',
          iconCls: 'favorites'
        }, {
          title: 'Tab 2',
          html: '2',
          cls: 'card2',
          iconCls: 'favorites'
        }, {
          title: 'Tab 3',
          html: '3',
          cls: 'card3',
          iconCls: 'favorites'
        }
      ];
      toolbar = {
        xtype: 'toolbar',
        ui: 'light',
        dock: 'top',
        defaults: {
          iconMask: true,
          ui: 'plain'
        },
        scroll: {
          direction: 'horizontal',
          useIndicators: false
        },
        layout: {
          pack: 'center'
        },
        items: [
          {
            iconCls: 'action'
          }, {
            iconCls: 'add'
          }, {
            iconCls: 'arrow_up'
          }
        ]
      };
      return new Ext.TabPanel({
        fullscreen: true,
        ui: 'dark',
        sortable: true,
        items: tabs,
        tabBar: {
          dock: 'bottom',
          scroll: {
            direction: 'horizontal',
            useIndicators: false
          },
          layout: {
            pack: 'center'
          }
        },
        dockedItems: toolbar
      });
    };
    return App;
  })();
  window.app = new App();
  window.app.models = {};
  window.app.controllers = {};
}).call(this);
