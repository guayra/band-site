class ToqueNotificado < ActiveRecord::Migration
  def self.up
    add_column :toques, :notificado, :boolean, :default=>false
  end

  def self.down
    remove_colum :toques, :notificado
  end
end
