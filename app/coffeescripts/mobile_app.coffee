# run rake barista:brew to force the compilation of all JavaScripts for the current application
class App
  
  constructor: ->
    new Ext.Application
      launch: this.launch
  
  launch: () =>
    
    tabs = [{
        title: 'Tab 1',
        html : '<div id="main-panel">Click my buttons!</div>',
        cls  : 'card1',
        iconCls: 'favorites'
      }, {
        title: 'Tab 2',
        html : '2',
        cls  : 'card2',
        iconCls: 'favorites'
      }, {
        title: 'Tab 3',
        html : '3',
        cls  : 'card3',
        iconCls: 'favorites'
      }
    ]

    toolbar =
      xtype: 'toolbar',
      ui: 'light',
      dock: 'top',
      defaults:
        iconMask: true,
        ui: 'plain'
      scroll: 
        direction: 'horizontal',
        useIndicators: false
      layout: 
        pack: 'center'
      items: [
          iconCls: 'action'
        ,
          iconCls: 'add'
        ,
          iconCls: 'arrow_up'
      ]

    new Ext.TabPanel
      fullscreen: true,
      ui:         'dark',
      sortable:   true,
      items:      tabs
      tabBar: 
        dock: 'bottom',
        scroll: 
          direction: 'horizontal',
          useIndicators: false
        layout:
          pack: 'center'
      dockedItems: toolbar
      
window.app = new App();
window.app.models = {};
window.app.controllers = {};