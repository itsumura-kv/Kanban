# == Schema Information
#
# Table name: project_users
#
#  id         :bigint(8)        not null, primary key
#  auth_flag  :boolean
#  project_id :bigint(8)
#  user_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProjectUser < ApplicationRecord
  belongs_to :project
  belongs_to :user
end
