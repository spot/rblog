class CreateArchives < ActiveRecord::Migration
  def self.up
    create_table :archives do |t|
      t.string :month
      t.string :year

      t.timestamps
    end
    add_column :posts, :archive_id, :integer
    add_index :archives, :month
    add_index :archives, :year
  end

  def self.down
    drop_table :archives
  end
end
