class CreateToques < ActiveRecord::Migration
  def self.up
    create_table :toques do |t|
      t.string    :nombre
      t.datetime  :cuando
      t.string    :donde
      t.string    :notas
      t.timestamps
    end
  end

  def self.down
    drop_table :toques
  end
end
