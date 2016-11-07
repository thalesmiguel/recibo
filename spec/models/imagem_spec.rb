require 'rails_helper'

RSpec.describe Imagem, type: :model do
  describe 'validações' do
    it 'exige nome' do
      imagem = Imagem.new(FactoryGirl.attributes_for(:imagem, nome: ''))
      puts imagem.arquivo
      expect(imagem.valid?).to be_falsy
    end
  end
end