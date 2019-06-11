class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses, id: :uuid do |t|
      t.string :descricao
      t.decimal :valor, precision: 5, scale: 2
      t.datetime :data
      t.references :user, type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
