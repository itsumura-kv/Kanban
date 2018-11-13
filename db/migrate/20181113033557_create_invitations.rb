class CreateInvitations < ActiveRecord::Migration[5.2]
  def change
    create_table :invitations do |t|
      t.integer :inviter
      t.integer :invitee
      t.references :project, foreign_key: true
      t.boolean :has_read

      t.timestamps
    end
  end
end
