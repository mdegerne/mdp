class CreateResults < ActiveRecord::Migration
  def self.up
    create_table :results do |t|
      t.integer :user_id
      t.string :resulthash
      t.integer :total
      t.timestamps
    end
  end

  def self.down
    drop_table :results
  end
end
