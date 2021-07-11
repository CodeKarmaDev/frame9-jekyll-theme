
export var OpenGallery = {

  init: function(node_tag, options = {}) {

    OpenGallery.options = options
    OpenGallery.tag = node_tag

    
    OpenGallery.nodes = document.querySelectorAll(`[${node_tag}]`);
    OpenGallery.addMenuEventListeners()
  },
  

  setOpenAttr: function(obj, val) {
    if( val ){
      obj.setAttribute(OpenGallery.tag, 'open')
    }else{
      obj.setAttribute(OpenGallery.tag, 'closed')
    }
  },


  onToggle: function(toggle_node) {
    if( toggle_node.getAttribute(OpenGallery.tag) == 'open' ){
    
      OpenGallery.setOpenAttr(toggle_node, false)
    
    } else {
      
      if( OpenGallery.options.reset_all ){
        OpenGallery.nodes.forEach( function(n){
          OpenGallery.setOpenAttr(n,false)
        },false);
      }
    
      OpenGallery.setOpenAttr(toggle_node, true)
    }
  },

  addMenuEventListeners: function() {
    OpenGallery.nodes.forEach( function(n){

      n.addEventListener("click",function(){
        OpenGallery.onToggle(n)
      },false);
      
    })  
  },
}
