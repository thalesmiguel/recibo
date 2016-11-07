require 'rails_helper'

RSpec.describe "imagens/edit", type: :view do
  before(:each) do
    @imagem = assign(:imagem, Imagem.create!())
  end

  it "renders the edit imagem form" do
    render

    assert_select "form[action=?][method=?]", imagem_path(@imagem), "post" do
    end
  end
end
