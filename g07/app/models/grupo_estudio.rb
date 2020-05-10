class GrupoEstudio < ApplicationRecord
  belongs_to :room

  validate :termino_despues_que_inicio
  validate :horario_bueno

  private

  def termino_despues_que_inicio
    return if termino.blank? || inicio.blank?

    if termino < inicio
      errors.add(:termino, "tiene que ser posterior al inicio")
    end
  end

  def horario_bueno
    errors.add(:inicio, "Sala de estudios no disponible en ese horario") unless validacion
  end
end
