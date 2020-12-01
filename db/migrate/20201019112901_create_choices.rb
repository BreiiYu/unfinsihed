class CreateChoices < ActiveRecord::Migration[5.2]
  def change
    create_table :choices do |t|
      t.integer :word_id
      t.string :choices
      t.boolean :correct

      t.timestamps
    end
  end
end
