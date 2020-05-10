class Curso < ApplicationRecord
  validates :nombre, presence: true
  validates :sigla, presence: true

  has_many :users
end
