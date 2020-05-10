class Campu < ApplicationRecord
  validates :nombre, presence: true
  validates :ubicacion, presence: true
  validates :mapa, presence: true
  has_many :rooms, :dependent => :destroy
end
