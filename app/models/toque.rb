class Toque < ActiveRecord::Base
  
  validates_presence_of :cuando
  validates_numericality_of :precio_anticipada
  validates_numericality_of :precio_puerta

  file_column :flyer #, :magick => { :versions => { :thumb => "50x50"}}

  belongs_to :locacion
  
  def donde
    return 'T.B.A.' if locacion.nil?
    return "#{locacion.nombre} - #{locacion.ciudad}"
  end
  
  def donde_full
    return 'T.B.A.' if locacion.nil?
    return "#{locacion.nombre} - #{locacion.calle} #{locacion.numero} #{locacion.depto} - #{locacion.localidad} - #{locacion.ciudad} - #{locacion.pais}"
  end
  
  def hora
    cuando.strftime("%H:%Mhs.")
  end
  
  def dia
    cuando.strftime("%d.%m.%Y")
  end
  
  def dia_semana
    return DIAS_SEMANA[cuando.strftime("%w").to_i]
  end
end
