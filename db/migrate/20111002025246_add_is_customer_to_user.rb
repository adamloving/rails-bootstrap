class AddIsCustomerToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :is_customer, :boolean
  end

  def self.down
    remove_column :users, :is_customer
  end
end
