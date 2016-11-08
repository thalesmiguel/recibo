class Comprovante < ApplicationRecord
  belongs_to :imagem

  validates :nome, presence: true
  validates :cidade, presence: true
  validates :data, presence: true
  validates :assinatura, presence: true
  validates :valor, presence: true

  def descricao_tratada
    descricao[0..40].gsub(/\s\w+\s*$/,'...')
  end
end
