# == Schema Information
#
# Table name: project_users
#
#  id         :bigint(8)        not null, primary key
#  project_id :bigint(8)
#  user_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ProjectUserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
