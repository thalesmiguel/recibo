require 'rails_helper'

RSpec.describe "comprovantes/index", type: :view do
  before(:each) do
    assign(:comprovantes, [
      Comprovante.create!(),
      Comprovante.create!()
    ])
  end

  it "renders a list of comprovantes" do
    render
  end
end
