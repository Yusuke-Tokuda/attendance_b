class AddRememberDigestToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :remenber_digest, :string
  end
end
