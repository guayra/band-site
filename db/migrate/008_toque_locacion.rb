class ToqueLocacion < ActiveRecord::Migration
  def self.up
    remove_column :toques, :donde
    add_column :toques, :locacion_id, :integer
  end

  def self.down
    remove_column :toques, :locacion_id
    add_column :toques, :donde, :string, :nil=>false
  end
end
