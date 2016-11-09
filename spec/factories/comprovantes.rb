FactoryGirl.define do
  factory :comprovante do
    nome "MyString"
    descricao "MyText"
    cidade "MyString"
    data "2016-11-07"
    assinatura "MyString"
    cpf "MyString"
    rg "MyString"
    valor "9,99"
    imagem nil
  end
end
