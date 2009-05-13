class CreateHeadings < ActiveRecord::Migration
  def self.up
    create_table :headings do |t|
      t.string :name
      t.integer :position
      t.timestamps
    end
  end

  def self.down
    drop_table :headings
  end
end
