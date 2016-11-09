class ComprovantesController < ApplicationController
  before_action :set_comprovante, only: [:update, :destroy]

  def index
    @imagens = Imagem.all
    @comprovantes = Comprovante.all
  end

  def new
    @imagens = Imagem.all
    @comprovante = Comprovante.new
    mostra_modal
  end

  def create
    @imagens = Imagem.all
    @comprovante = Comprovante.new(comprovante_params)

    respond_to do |format|
      if @comprovante.save
        format.js { render file: 'ajax/application/crud.js.erb', locals: { notice: 'Comprovante criado com sucesso.', obj: @comprovante, acao: action_name } }
      else
        format.js { render file: 'ajax/application/crud.js.erb', locals: { obj: @comprovante } }
      end
    end
  end

  def update
    @imagens = Imagem.all
    respond_to do |format|
      if @comprovante.update(comprovante_params)
        format.js { render file: 'ajax/application/crud.js.erb', locals: { notice: 'Comprovante alterado com sucesso.', obj: @comprovante, acao: action_name } }
      else
        format.js { render file: 'ajax/application/crud.js.erb', locals: { obj: @comprovante } }
      end
    end
  end

  def destroy
    @comprovante.destroy
    respond_to do |format|
      format.js { render file: 'ajax/application/crud.js.erb', locals: { notice: 'Comprovante excluído com sucesso.', obj: @comprovante, acao: action_name } }
    end
  end

  private
      def mostra_modal
      respond_to do |format|
        format.js { render file: "ajax/comprovantes/mostra_modal.js.erb" }
      end
    end

    def set_comprovante
      @comprovante = Comprovante.find(params[:id])
    end

    def comprovante_params
      params.require(:comprovante).permit(:nome, :descricao, :cidade, :data, :assinatura, :cpf, :rg, :valor, :imagem_id)
    end
end
