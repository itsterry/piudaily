class CreateAssets < ActiveRecord::Migration
  def self.up
    create_table :assets do |t|
      t.integer :prompt_id
      t.string :attachment
      t.timestamps
    end
    add_index :assets, :prompt_id
    add_index :assets, [:prompt_id, :attachment]
  end

  def self.down
    drop_table :assets
  end
end
