class ComprovantesController < ApplicationController
  before_action :set_comprovante, only: [:show, :edit, :update, :destroy]

  def index
    @imagens = Imagem.all
    @comprovantes = Comprovante.all
  end

  def show
  end

  def new
    @imagens = Imagem.all
    @comprovante = Comprovante.new
    mostra_modal
  end

  def edit
  end

  def create
    @comprovante = Comprovante.new(comprovante_params)

    respond_to do |format|
      if @comprovante.save
        format.js { render file: 'comprovantes/sucesso.js.erb', locals: { notice: 'Compravante criado com sucesso.' } }
      else
        format.js { render file: 'comprovantes/falha.js.erb' }
      end
    end
  end

  def update
    respond_to do |format|
      if @comprovante.update(comprovante_params)
        format.js { render file: 'comprovantes/sucesso.js.erb', locals: { notice: 'Compravante alterado com sucesso.' } }
      else
        format.js { render file: 'comprovantes/falha.js.erb' }
      end
    end
  end

  def destroy
    @comprovante.destroy
    respond_to do |format|
      format.html { redirect_to comprovantes_url, notice: 'Comprovante was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
      def mostra_modal
      respond_to do |format|
        format.js { render file: "comprovantes/mostra_modal.js.erb" }
      end
    end

    def set_comprovante
      @comprovante = Comprovante.find(params[:id])
    end

    def comprovante_params
      params.require(:comprovante).permit(:nome, :descricao, :cidade, :data, :assinatura, :cpf, :rg, :valor, :imagem_id)
    end
end
