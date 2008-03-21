class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories, :force => true do |t|
      t.string :name
      t.integer :sort

      t.timestamps
    end
    
    # Create the join table
    create_table :categories_posts, :id => false do |t|
      t.references :category, :post
    end
    
    # Add indexs to the join table
    add_index "categories_posts", "category_id"
    add_index "categories_posts", "post_id"
    
  end

  def self.down
    drop_table :categories
    drop_table :categories_posts
  end
end
