class Room < ApplicationRecord
    belongs_to :campu
    has_many :grupo_estudios, :dependent => :destroy
    has_many :sala_ocupadas, :dependent => :destroy
    has_many :clases_ofrezcos, :dependent => :destroy
    has_many :clases_buscos, :dependent => :destroy
end
