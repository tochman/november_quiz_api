class CreateQuizCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :quiz_categories do |t|
      t.integer :api_id
      t.string :name

      t.timestamps
    end
  end
end
