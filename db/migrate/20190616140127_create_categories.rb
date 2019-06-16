class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories, id: :uuid do |t|
      t.string :descricao
      t.references :expenses,type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
