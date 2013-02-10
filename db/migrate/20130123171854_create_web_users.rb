class CreateWebUsers < ActiveRecord::Migration
  def change
    create_table :web_users do |t|
      t.string :email
      t.string :password
      t.string :name

      t.timestamps
    end
  end
end
