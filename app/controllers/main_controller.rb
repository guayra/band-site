class MainController < ApplicationController
  
  def index
    inicio
    render :action=>'inicio'
  end
  
  def inicio
    @proximos_toques = Toque.find(:all, :conditions=>"DATEDIFF(DATE(cuando),CURDATE())>=0", :order=>'cuando ASC')
    @ultima_noticia = Noticia.find(:first, :order=>'created_at DESC')
    @toques_portada = Toque.find(:all, :conditions=>"(portada = true) and (flyer is not null) and (DATEDIFF(DATE(cuando),CURDATE())>=0)", :order=>'cuando ASC')
  end
  
  def bio
  end

  def extras
  end
  
  def fotos
  end

  def musica
  end

  def webmail
    redirect_to 'http://www.disfrutaguayra.com.ar:2095/'
  end

  def contacto
  end

end
