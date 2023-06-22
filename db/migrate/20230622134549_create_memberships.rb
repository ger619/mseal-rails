class CreateMemberships < ActiveRecord::Migration[7.0]
  def change
    create_table :memberships do |t|
      t.string :type_of_membership
      t.string :title
      t.string :country
      t.string :date_of_birth
      t.string :email
      t.string :phone_number
      t.string :photo

      t.timestamps
    end
  end
end
