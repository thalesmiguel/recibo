class Imagem < ApplicationRecord
  has_many :comprovantes

  has_attached_file :arquivo, styles: { thumb: 'x100', croppable: '600x600>', big: '1000x1000>' }

  validates_attachment_content_type :arquivo, content_type: /\Aimage\/.*\z/
  validates :nome, presence: true

end
