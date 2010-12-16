class TestingPurpose < ActiveRecord::Migration
  def self.up
    change_column :authors, :name, :string, :null => true, :limit => 255

    remove_index :authors, :name => :index_authors_on_name rescue ActiveRecord::StatementInvalid
  end

  def self.down
    change_column :authors, :name, :string, :null => false

    add_index :authors, [:name], :unique => true
  end
end
