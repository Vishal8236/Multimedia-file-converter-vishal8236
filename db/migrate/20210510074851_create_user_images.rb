class CreateUserImages < ActiveRecord::Migration[6.0]
  def change
    create_table :user_images do |t|
      t.references :user, null: false, foreign_key: true
      t.string :user_img, null: false
      t.timestamps
    end
  end
end
