class CreateNotes < ActiveRecord::Migration[7.1]
  def change
    create_table :notes do |t|
      t.text :note
      t.integer :rating
      t.references :appointment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
