class CreateReservas < ActiveRecord::Migration[5.2]
  def change
    create_table :reservas do |t|
      t.string :evento
      t.time :inicio
      t.time :termino
      t.references :sala, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
