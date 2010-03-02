class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.integer :facebook_id, :limit=>"20", :null=>false
      t.string :session_key
      t.timestamps
    end
    execute("alter table users modify facebook_id bigint")
  end

  def self.down
    drop_table :users
  end
end
