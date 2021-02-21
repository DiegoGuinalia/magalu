class CreateCredentials < ActiveRecord::Migration[5.0]
  def change
    create_table :credentials do |t|
      t.string :description
      t.string :api_key
      t.integer :user_id

      t.timestamps
    end
  end
end
