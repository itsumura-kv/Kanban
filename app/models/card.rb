# == Schema Information
#
# Table name: cards
#
#  id         :bigint(8)        not null, primary key
#  title      :string
#  user_id    :bigint(8)
#  due_date   :date
#  project_id :bigint(8)
#  column_id  :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Card < ApplicationRecord
  belongs_to :user
  belongs_to :column
  belongs_to :project
end
