require 'rails_helper'

RSpec.describe "imagens/index", type: :view do
  before(:each) do
    assign(:imagens, [
      Imagem.create!(),
      Imagem.create!()
    ])
  end

  it "renders a list of imagens" do
    render
  end
end
