class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :customer_id
      t.string :email
      t.string :address_1
      t.string :addres_2
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :country
      t.string :card_type
      t.string :last_4
      t.string :card_exp_month
      t.string :card_exp_year
      t.string :default_method_id

      t.timestamps
    end
  end
end
