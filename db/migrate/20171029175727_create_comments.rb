class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.string :guest_name, null: false
      t.references :post, foreign_key: true
      t.integer :commentor_id

      t.timestamps
    end
  end
end
