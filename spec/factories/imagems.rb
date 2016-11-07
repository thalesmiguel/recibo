FactoryGirl.define do
  factory :imagem do
    nome "MyString"
    # arquivo { File.new("#{Rails.root}/spec/support/fixtures/imagem.jpg") }
    arquivo_file_name 'imagem.jpg'
  end
end
