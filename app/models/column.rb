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

class Column < ApplicationRecord
  belongs_to :project

  has_many :cards, -> { order(id: :asc) }
end
