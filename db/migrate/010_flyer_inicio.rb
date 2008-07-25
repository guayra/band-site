class FlyerInicio < ActiveRecord::Migration
  def self.up
    add_column :toques, :portada, :boolean, :default=>false
  end

  def self.down
    remove_column :toques, :portada
  end
end
