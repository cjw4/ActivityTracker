class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :units
      t.references :user, foreign_key: true

      t.timestamps
    end
		add_index :activities, [:user_id, :created_at]
  end
end
