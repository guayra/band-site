class CreateLocaciones < ActiveRecord::Migration
  def self.up
    create_table :locaciones do |t|
      t.string  :nombre, :null => false

      t.string  :persona_contacto
      t.string  :horario_contacto
      t.string  :telefono
      t.string  :mail

      t.string  :calle
      t.integer :numero
      t.string  :depto

      t.string  :localidad
      t.string  :ciudad, :default=>'Capital Federal'
      t.string  :pais, :default=>'Argentina'

      t.integer :capacidad
      t.float   :precio
      t.text    :detalles

      t.integer :rate

      t.timestamps
    end
  end

  def self.down
    drop_table :locaciones
  end
end
