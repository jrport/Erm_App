class Loja < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    [ "id", "id_value", "nome" ]
  end
end
