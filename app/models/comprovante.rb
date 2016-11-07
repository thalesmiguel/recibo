class Comprovante < ApplicationRecord
  belongs_to :imagem

  validates :nome, presence: true
  validates :cidade, presence: true
  validates :data, presence: true
  validates :assinatura, presence: true
  validates :valor, presence: true
end
