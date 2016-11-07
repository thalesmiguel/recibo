require 'rails_helper'

RSpec.describe Imagem, type: :model do

  describe 'validações' do
    it 'exige nome' do
      imagem = Imagem.new(FactoryGirl.attributes_for(:imagem, nome: ''))
      expect(imagem.valid?).to be_falsy
    end
  end

  describe 'associações' do
    it 'has_many Comprovante' do
      imagem = FactoryGirl.create(:imagem)
      comprovante = FactoryGirl.create(:comprovante, imagem: imagem)
      expect(imagem.comprovantes).to eq([comprovante])
    end
  end

end
