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

class Project < ApplicationRecord
  has_many :columns
  has_many :invitations
  has_many :logs

  has_many :project_users
  has_many :users, through: :project_users

  belongs_to :admin_user, class_name: 'User'

  has_many :cards
end
