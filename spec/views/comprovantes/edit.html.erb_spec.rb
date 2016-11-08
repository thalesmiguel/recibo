require 'rails_helper'

RSpec.describe "comprovantes/edit", type: :view do
  before(:each) do
    @comprovante = assign(:comprovante, Comprovante.create!())
  end

  it "renders the edit comprovante form" do
    render

    assert_select "form[action=?][method=?]", comprovante_path(@comprovante), "post" do
    end
  end
end
