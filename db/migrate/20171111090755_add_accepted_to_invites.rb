class AddAcceptedToInvites < ActiveRecord::Migration[5.1]
  def change
    add_column :invites, :accepted, :boolean
  end
end
