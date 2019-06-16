class AddExpenseToCategory < ActiveRecord::Migration[6.0]
  def change
    add_reference :categories, :expense, type: :uuid, null: false, foreign_key: true
  end
end
