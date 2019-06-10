class CreateOutlays < ActiveRecord::Migration[6.0]
  def change
    create_table :outlays, id: :uuid do |t|
      t.string :description
      t.decimal :value, precision: 5, scale: 2
      t.datetime :date_operation
      t.references :user, type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
