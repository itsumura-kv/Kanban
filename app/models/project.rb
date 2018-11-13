# == Schema Information
#
# Table name: projects
#
#  id         :bigint(8)        not null, primary key
#  title      :string
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Project < ApplicationRecord
  has_many :columns
  has_many :invitations
  has_many :logs

  has_many :project_users
  has_many :users, through: :project_users
end
