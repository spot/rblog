class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments, :force => true do |t|
      t.string :name
      t.string :email
      t.string :url
      t.text :comment
      t.references :post

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
