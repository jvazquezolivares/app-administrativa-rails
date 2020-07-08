class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :sales
  has_many :warehouse_records
  has_one :profile, dependent: :destroy

  after_create :set_profile

  def set_profile
    self.profile = Profile.create()
  end
end
