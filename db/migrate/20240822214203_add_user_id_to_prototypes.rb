class AddUserIdToPrototypes < ActiveRecord::Migration[7.0]
  def change
    add_references :prototypes, :user, null: false, foreign_key: true
  end
end
