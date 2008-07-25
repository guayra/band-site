class NoticiasImage < ActiveRecord::Migration
  def self.up
    add_column :noticias, :image, :string
  end

  def self.down
    remove_column :noticias, :image
  end
end
