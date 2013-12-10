class ChangeTextFromStringToText < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.change :text, :string
    end
  end
 
  def self.down
    change_table :widgets do |t|
      t.change :test, :text
    end
  end
end
