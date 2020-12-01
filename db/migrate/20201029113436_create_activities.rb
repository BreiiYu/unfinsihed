class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.integer :actionable_id
      t.string :actionable_type
      t.integer :user_id

      t.timestamps
    end
  end
end
