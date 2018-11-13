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

require 'test_helper'

class InvitationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
