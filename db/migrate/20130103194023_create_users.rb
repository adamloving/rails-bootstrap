class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :provider
      t.string :uid
      t.string :photo_url
      t.string :access_token
    end
  end

  def down
    drop_table :users
  end
end
