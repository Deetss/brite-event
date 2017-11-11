class CreateInvites < ActiveRecord::Migration[5.1]
  def change
    create_table :invites do |t|
      t.belongs_to :user, index: true
      t.belongs_to :event, index: true
      
      t.timestamps
    end
  end
end
