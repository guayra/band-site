# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  include TagsHelper
   
  # FIXME el simple history no esta funcionando. creo que es porque no uso respond con js
   
  def add_simple_history(name, url,method)
    %[dhtmlHistory.add("#{name}", "new Ajax.Request('#{url}', {asynchronous:false, evalScripts:true, method:'#{method}'});")]
  end
      
  def link_content_to( string, url, method = :get, html = {} )
    link_to_remote string,:update=>'content', 
        :url=>url, :html=>html, :method=>method,
        :before=>%(Element.hide('content');Element.show( 'loading')),
        :success=>%(Element.hide('loading');Element.show('content');#{add_simple_history(url,url,method)}),
        :failure=>%(alert('Surgi&oacute; un error al buscar la informaci&oacute;n.');Element.hide('loading');Element.show('content'))
  end

  def init_tinyMCE
    render :partial=>'layouts/tinymce'
  end
  
end