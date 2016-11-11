class ComprovantesController < ApplicationController
  before_action :set_comprovante, only: [:update, :destroy]
  before_action :carrega_dependencias, only: [:index, :new, :create, :update]

  def index
    @comprovantes = Comprovante.all.order(data: :desc)
  end

  def new
    @comprovante = Comprovante.new
    mostra_modal
  end

  def create
    @comprovante = Comprovante.new(comprovante_params)

    if @comprovante.save
      renderiza_crud_js(@comprovante, 'Comprovante criado com sucesso.')
    else
      renderiza_crud_js(@comprovante)
    end
  end

  def update
    if @comprovante.update(comprovante_params)
      renderiza_crud_js(@comprovante, 'Comprovante alterado com sucesso.')
    else
      renderiza_crud_js(@comprovante)
    end
  end

  def destroy
    @comprovante.destroy

    renderiza_crud_js(@comprovante, 'Comprovante excluído com sucesso.')
  end

  def imprimir
    comprovantes = []
    params[:comprovante]['id'].each do |comprovante|
      comprovantes << comprovante
    end
    @comprovantes = Comprovante.where(:id => comprovantes)

    respond_to do |format|
      format.pdf do
        render pdf: "comprovante",
               layout: "impressao",
               file: "relatorios/comprovantes/comprovantes.html.erb",
               page_size: 'A4',
               show_as_html: params.key?('debug')
              #  window_status: "pronto"
      end
    end

  end

  private

    def renderiza_crud_js(objeto, mensagem = '', acao = action_name)
      respond_to do |format|
        format.js { render file: 'ajax/application/crud.js.erb', locals: { notice: mensagem, obj: objeto, acao: acao } }
      end
    end

    def mostra_modal
      respond_to do |format|
        format.js { render file: "ajax/comprovantes/mostra_modal.js.erb" }
      end
    end

    def carrega_dependencias
      @imagens = Imagem.all
    end

    def set_comprovante
      @comprovante = Comprovante.find(params[:id])
    end

    def comprovante_params
      params.require(:comprovante).permit(:nome, :descricao, :cidade, :data, :assinatura, :cpf, :rg, :valor, :imagem_id)
    end
end
