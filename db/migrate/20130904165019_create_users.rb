class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.string :name, uniqueness: true
      t.string :email, uniqueness: true
      t.string :password_hash

      t.timestamps
    end
  end
end
