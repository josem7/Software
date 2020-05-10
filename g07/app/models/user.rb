class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cursos
  has_attached_file :avatar, styles: { small: "300x300>", thumb: "100x100>" }, default_url: "https://www.cmcaindia.org/wp-content/uploads/2015/11/default-profile-picture-gmail-2.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
