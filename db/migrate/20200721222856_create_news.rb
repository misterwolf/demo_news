class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.integer :author_id,  null: false
      t.string  :title,      null: false
      t.string  :content,    null: false
      t.timestamps null: false
    end
  end
end
