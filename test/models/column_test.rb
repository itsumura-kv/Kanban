# == Schema Information
#
# Table name: columns
#
#  id         :bigint(8)        not null, primary key
#  title      :string
#  project_id :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ColumnTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
