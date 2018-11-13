# == Schema Information
#
# Table name: logs
#
#  id         :bigint(8)        not null, primary key
#  content    :string
#  project_id :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Log < ApplicationRecord
  belongs_to :project
end
