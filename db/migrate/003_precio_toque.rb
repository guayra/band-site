class PrecioToque < ActiveRecord::Migration
  def self.up
    add_column :toques, :precio_anticipada, :float
    add_column :toques, :precio_puerta, :float
  end

  def self.down
    remove_column :toques, :precio_anticipada
    remove_column :toques, :precio_puerta
  end
end
