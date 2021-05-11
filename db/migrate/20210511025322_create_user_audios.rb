class CreateUserAudios < ActiveRecord::Migration[6.0]
  def change
    create_table :user_audios do |t|
      t.references :user, null: false, foreign_key: true
      t.string :user_audio, null: false
      t.timestamps
    end
  end
end
