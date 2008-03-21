class CreateLinks < ActiveRecord::Migration
  def self.up
    create_table :links, :force => true do |t|
			t.string :name, :url
			t.text :description
			t.timestamps
		end
	end

  def self.down
    drop_table :links
  end
end
