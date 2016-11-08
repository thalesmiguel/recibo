require 'rails_helper'

RSpec.describe "comprovantes/show", type: :view do
  before(:each) do
    @comprovante = assign(:comprovante, Comprovante.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
