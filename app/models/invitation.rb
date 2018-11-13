# == Schema Information
#
# Table name: invitations
#
#  id         :bigint(8)        not null, primary key
#  inviter    :integer
#  invitee    :integer
#  project_id :bigint(8)
#  has_read   :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Invitation < ApplicationRecord
  belongs_to :project

  belongs_to :inviter, :class_name => 'User'
  belongs_to :invitee, :class_name => 'User'
end
