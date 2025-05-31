class AddBirthdayToUser < ActiveRecord::Migration[8.0]
  def change
    add_column :user, :birthday, :date
  end
end
