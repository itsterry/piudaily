class CreatePrompts < ActiveRecord::Migration
  def self.up
    create_table :prompts do |t|
      t.string :title
      t.boolean :displayit
      t.integer :asset_id
      t.timestamps
    end
    add_index :prompts, :displayit
    add_index :prompts, :asset_id
    add_index :prompts, :title
  end

  def self.down
    drop_table :prompts
  end
end
