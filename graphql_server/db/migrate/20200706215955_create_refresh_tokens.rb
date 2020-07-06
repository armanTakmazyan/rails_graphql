class CreateRefreshTokens < ActiveRecord::Migration[6.0]
  def change
    create_table :refresh_tokens do |t|
      t.references :user, null: false, foreign_key: true
      t.string :refresh_token, null: false 
      t.datetime :expire_at, null: false 

      t.timestamps
    end
  end
end
