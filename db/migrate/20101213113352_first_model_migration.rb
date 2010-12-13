class FirstModelMigration < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string   :crypted_password, :limit => 40
      t.string   :salt, :limit => 40
      t.string   :remember_token
      t.datetime :remember_token_expires_at
      t.string   :name
      t.string   :email_address
      t.boolean  :administrator, :default => false
      t.datetime :created_at
      t.datetime :updated_at
      t.string   :state, :default => "active"
      t.datetime :key_timestamp
    end
    add_index :users, [:state]

    create_table :posts do |t|
      t.string   :title
      t.text     :content
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :authors do |t|
      t.string   :name, :null => false
      t.datetime :created_at
      t.datetime :updated_at
    end
    add_index :authors, [:name], :unique => true
  end

  def self.down
    drop_table :users
    drop_table :posts
    drop_table :authors
  end
end
