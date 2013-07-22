class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :contact_first_name
      t.string :contact_last_name
      t.string :contact_email
      t.string :contact_mobile
      t.string :contact_phone

      t.timestamps
    end
  end
end
