# == Schema Information
#
# Table name: projects
#
#  id            :bigint(8)        not null, primary key
#  title         :string
#  content       :text
#  admin_user_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
