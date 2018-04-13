class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.references :user, :index => true
      t.string :first_name
      t.string :last_name
      t.timestamps
    end
  end
end
