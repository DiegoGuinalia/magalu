class CreateCredentials < ActiveRecord::Migration[5.0]
  def change
    create_table :credentials do |t|
      t.string :name
      t.string :description
      t.string :api_key

      t.timestamps
    end
  end
end
