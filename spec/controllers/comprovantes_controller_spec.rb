require 'rails_helper'


RSpec.describe ComprovantesController, type: :controller do

  let(:imagem) { FactoryGirl.create(:imagem) }

  let(:valid_attributes) {
    FactoryGirl.attributes_for(:comprovante, imagem_id: imagem.id)
  }

  let(:invalid_attributes) {
    FactoryGirl.attributes_for(:comprovante, nome: '', imagem_id: imagem.id)
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all comprovantes as @comprovantes" do
      comprovante = Comprovante.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:comprovantes)).to eq([comprovante])
    end
  end

  describe "GET #new" do
    it "assigns a new comprovante as @comprovante" do
      get :new, xhr: true, params: {}, session: valid_session
      expect(assigns(:comprovante)).to be_a_new(Comprovante)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Comprovante" do
        expect {
          post :create, xhr: true, params: {comprovante: valid_attributes}, session: valid_session
        }.to change(Comprovante, :count).by(1)
      end

      it "assigns a newly created comprovante as @comprovante" do
        post :create, xhr: true, params: {comprovante: valid_attributes}, session: valid_session
        expect(assigns(:comprovante)).to be_a(Comprovante)
        expect(assigns(:comprovante)).to be_persisted
      end

      it "renderiza novo comprovante" do
        post :create, xhr: true, params: {comprovante: valid_attributes}, session: valid_session
        expect(response).to render_template("ajax/application/crud.js.erb")
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved comprovante as @comprovante" do
        post :create, xhr: true, params: {comprovante: invalid_attributes}, session: valid_session
        expect(assigns(:comprovante)).to be_a_new(Comprovante)
      end

      it "renderiza mensagem de erro" do
        post :create, xhr: true, params: {comprovante: invalid_attributes}, session: valid_session
        expect(response).to render_template("ajax/application/crud.js.erb")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        FactoryGirl.attributes_for(:comprovante, nome: 'Novo nome', imagem: imagem)
      }

      it "updates the requested comprovante" do
        comprovante = Comprovante.create! valid_attributes
        put :update, xhr: true, params: {id: comprovante.to_param, comprovante: new_attributes}, session: valid_session
        comprovante.reload
        expect(comprovante.nome).to eq("Novo nome")
      end

      it "assigns the requested comprovante as @comprovante" do
        comprovante = Comprovante.create! valid_attributes
        put :update, xhr: true, params: {id: comprovante.to_param, comprovante: valid_attributes}, session: valid_session
        expect(assigns(:comprovante)).to eq(comprovante)
      end

      it "renderiza alterações do comprovante" do
        comprovante = Comprovante.create! valid_attributes
        put :update, xhr: true, params: {id: comprovante.to_param, comprovante: valid_attributes}, session: valid_session
        expect(response).to render_template("ajax/application/crud.js.erb")
      end
    end

    context "with invalid params" do
      it "assigns the comprovante as @comprovante" do
        comprovante = Comprovante.create! valid_attributes
        put :update, xhr: true, params: {id: comprovante.to_param, comprovante: invalid_attributes}, session: valid_session
        expect(assigns(:comprovante)).to eq(comprovante)
      end

      it "renderiza mensagem de erro" do
        comprovante = Comprovante.create! valid_attributes
        put :update, xhr: true, params: {id: comprovante.to_param, comprovante: invalid_attributes}, session: valid_session
        expect(response).to render_template("ajax/application/crud.js.erb")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested comprovante" do
      comprovante = Comprovante.create! valid_attributes
      expect {
        delete :destroy, xhr: true, params: {id: comprovante.to_param}, session: valid_session
      }.to change(Comprovante, :count).by(-1)
    end

    it "redirects to the comprovantes list" do
      comprovante = Comprovante.create! valid_attributes
      delete :destroy, xhr: true, params: {id: comprovante.to_param}, session: valid_session
      expect(response).to render_template("ajax/application/crud.js.erb")
    end
  end

end
