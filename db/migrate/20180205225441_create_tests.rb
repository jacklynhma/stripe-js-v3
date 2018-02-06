class CreateTests < ActiveRecord::Migration[5.1]
  def change
    create_table :tests do |t|
      t.string :stripeToken, null: false
      t.timestamps
    end
  end
end
