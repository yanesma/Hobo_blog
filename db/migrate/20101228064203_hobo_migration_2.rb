class HoboMigration2 < ActiveRecord::Migration
  def self.up
    add_column :authors, :user_id, :integer

    remove_index :authors, :name => :index_authors_on_name rescue ActiveRecord::StatementInvalid
    add_index :authors, [:user_id]
  end

  def self.down
    remove_column :authors, :user_id

    remove_index :authors, :name => :index_authors_on_user_id rescue ActiveRecord::StatementInvalid
    add_index :authors, [:name], :unique => true
  end
end
