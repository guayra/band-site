class Noticia < ActiveRecord::Base

  validates_presence_of :titulo, :cuerpo
  
  file_column :image #, :magick => { :versions => { :thumb => "50x50"}}
end
