class ToqueFlyer < ActiveRecord::Migration
  def self.up
    add_column :toques, :flyer, :string
  end

  def self.down
    remove_column :toques, :flyer
  end
end
