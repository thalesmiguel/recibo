require 'rails_helper'

RSpec.describe "comprovantes/new", type: :view do
  before(:each) do
    assign(:comprovante, Comprovante.new())
  end

  it "renders new comprovante form" do
    render

    assert_select "form[action=?][method=?]", comprovantes_path, "post" do
    end
  end
end
