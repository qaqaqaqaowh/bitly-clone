class CreateLinks < ActiveRecord::Migration[5.1]
	def change
		create_table :links do |t|
			t.string :link
			t.string :encrypt
		end
	end
end