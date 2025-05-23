class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.references :creator, null: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end