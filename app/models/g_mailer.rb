class GMailer < ActionMailer::Base
  
  def recis_com_ar(toque)
    @recipients   = 'fechas@recis.com.ar'
    @bcc          = 'dwaynemac@gmail.com'
    @from         = '"Difusion Guayra" <difusion@disfrutaguayra.com.ar>'
    @subject      = "Publicar fecha de GUAYRA"
    @sent_on      = Time.now
    @content_type = "text/html"
    
    body[:toque] = toque
  end
  
end
