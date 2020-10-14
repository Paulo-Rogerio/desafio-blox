class Reserva < ApplicationRecord
  belongs_to :sala
  belongs_to :user

  validate :reserva_exists

  protected

  def reserva_exists

    cond_1 = Reserva.where(sala_id: self.sala_id).where(inicio: self.inicio).exists?
    cond_2 = Reserva.where(sala_id: self.sala_id).where(termino: self.termino).exists?
    cond_3 = true unless self.inicio.strftime('%H:%M') < self.termino.strftime('%H:%M')

    if cond_1 || cond_2 || cond_3 then
      errors.add(:sala_id, 'Sala Reservada')
    end

  end

end

