require 'rails_helper'

RSpec.describe "imagens/show", type: :view do
  before(:each) do
    @imagem = assign(:imagem, Imagem.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
