# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  uid                    :string
#  provider               :string
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#  image_path             :string
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  has_many :cards

  has_many :project_users
  has_many :projects, through: :project_users

  has_one :user, through: :invitations, foreign_key: :inviter
  has_many :users, through: :invitations, foreign_key: :invitee

  has_many :projects, foreign_key: :admin_user

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first
 
    unless user
      # FBから画像を取得して保存
      require 'open-uri'
      download = open(auth.info.image)
      new_image_name = "#{auth.uid}.jpg"
      IO.copy_stream(download, "public/img/profile/#{new_image_name}")

      user = User.create(
        uid:        auth.uid,
        provider:   auth.provider,
        name:       auth.info.name,
        email:      auth.info.email,
        password:   Devise.friendly_token[0, 20],
        image_path: new_image_name
      )
    end
 
    user
  end
end
