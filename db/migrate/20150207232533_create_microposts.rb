class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.references :user, index: true
      t.text :content

      t.timestamps null: false
    end
    add_foreign_key :microposts, :users
    add_index :microposts, [:user_id, :created_at]
  end
end
