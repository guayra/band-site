class Locacion < ActiveRecord::Base

  acts_as_taggable
  
  validates_numericality_of :numero, :only_integer=>true, :allow_nil => true
  validates_numericality_of :precio, :allow_nil => true
  validates_numericality_of :capacidad, :only_integer=>true, :allow_nil => true
  validates_numericality_of :rate, :only_integer=>true, :allow_nil => true
  
  validates_presence_of     :nombre
  
  has_many :toques, :dependent=>:nullify
  
end
