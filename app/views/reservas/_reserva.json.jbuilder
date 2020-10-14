json.extract! reserva, :id, :evento, :inicio, :termino, :sala_id, :user_id, :created_at, :updated_at
json.url reserva_url(reserva, format: :json)
