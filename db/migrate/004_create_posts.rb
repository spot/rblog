class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts, :force => true do |t|
      t.string :title
      t.text :body
      t.references :user
      t.string :permalink
      t.boolean :publish

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
