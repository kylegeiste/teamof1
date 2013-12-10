class ChangeTextDataType < ActiveRecord::Migration
  def self.up
   change_column :posts, :text, :text
  end

  def self.down
   change_column :posts, :text, :string
  end
end