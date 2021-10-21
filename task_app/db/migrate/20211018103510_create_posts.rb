class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :tittle
      t.date :start
      t.date :stop
      t.text :detail

      t.timestamps
    end
  end
end
