class ReturnToOriginalState < ActiveRecord::Migration
  def self.up
    change_column :authors, :name, :string, :null => false, :limit => 255
  end

  def self.down
    change_column :authors, :name, :string
  end
end
