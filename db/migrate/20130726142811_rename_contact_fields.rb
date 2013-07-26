class RenameContactFields < ActiveRecord::Migration
  def change
    rename_column :contacts, :contact_first_name, :first_name
    rename_column :contacts, :contact_last_name, :last_name
    rename_column :contacts, :contact_email, :email
    rename_column :contacts, :contact_mobile, :mobile
    rename_column :contacts, :contact_phone, :phone
  end
end
