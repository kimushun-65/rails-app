class CreateBoards < ActiveRecord::Migration[8.0]
  def change
    create_table :boards do |t|
      t.string :author_name
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
