require 'rails_helper'

RSpec.describe "imagens/new", type: :view do
  before(:each) do
    assign(:imagem, Imagem.new())
  end

  it "renders new imagem form" do
    render

    assert_select "form[action=?][method=?]", imagens_path, "post" do
    end
  end
end
