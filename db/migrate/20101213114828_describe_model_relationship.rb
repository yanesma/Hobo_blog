class DescribeModelRelationship < ActiveRecord::Migration
  def self.up
    add_column :posts, :author_id, :integer

    add_index :posts, [:author_id]
  end

  def self.down
    remove_column :posts, :author_id

    remove_index :posts, :name => :index_posts_on_author_id rescue ActiveRecord::StatementInvalid
  end
end
