class Imagem < ApplicationRecord
  has_attached_file :arquivo, styles: { thumb: 'x100', croppable: '600x600>', big: '1000x1000>' }
  validates_attachment_content_type :arquivo, content_type: "application/jpg"
end
