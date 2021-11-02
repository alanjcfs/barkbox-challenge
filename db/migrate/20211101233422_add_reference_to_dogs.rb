class AddReferenceToDogs < ActiveRecord::Migration[5.2]
  def change
    add_reference :dogs, :owner, references: :users, index: true
  end
end
