require 'rails_helper'

RSpec.describe Comprovante, type: :model do

  describe 'validações' do
    let(:imagem) { FactoryGirl.create(:imagem) }
    it 'exige nome' do
      comprovante = Comprovante.new(FactoryGirl.attributes_for(:comprovante, nome: '', imagem: imagem))
      expect(comprovante.valid?).to be_falsy
    end

    it 'exige cidade' do
      comprovante = Comprovante.new(FactoryGirl.attributes_for(:comprovante, cidade: '', imagem: imagem))
      expect(comprovante.valid?).to be_falsy
    end

    it 'exige data' do
      comprovante = Comprovante.new(FactoryGirl.attributes_for(:comprovante, data: '', imagem: imagem))
      expect(comprovante.valid?).to be_falsy
    end

    it 'exige assinatura' do
      comprovante = Comprovante.new(FactoryGirl.attributes_for(:comprovante, assinatura: '', imagem: imagem))
      expect(comprovante.valid?).to be_falsy
    end

    it 'exige valor' do
      comprovante = Comprovante.new(FactoryGirl.attributes_for(:comprovante, valor: '', imagem: imagem))
      expect(comprovante.valid?).to be_falsy
    end

  end

  describe 'associações' do

    it 'belongs_to Imagem' do
      imagem = FactoryGirl.create(:imagem)
      comprovante = Comprovante.new(FactoryGirl.attributes_for(:comprovante, imagem: imagem))
      expect(comprovante.imagem).to eq(imagem)
    end

  end

  describe 'métodos' do

    it 'retorna descrição com 40 caractéres' do
      imagem = FactoryGirl.create(:imagem)
      comprovante = FactoryGirl.create(:comprovante, imagem: imagem)
      expect(comprovante.descricao_tratada.length).to be < 40
    end
  end
end
