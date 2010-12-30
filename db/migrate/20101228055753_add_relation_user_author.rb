class AddRelationUserAuthor < ActiveRecord::Migration
  def self.up
    remove_index :authors, :name => :index_authors_on_name rescue ActiveRecord::StatementInvalid
  end

  def self.down
    add_index :authors, [:name], :unique => true
  end
end
