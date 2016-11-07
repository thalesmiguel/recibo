require 'rails_helper'

RSpec.describe ImagensController, type: :controller do

  let(:valid_attributes) {
    FactoryGirl.attributes_for(:imagem)
  }

  let(:invalid_attributes) {
    FactoryGirl.attributes_for(:imagem, nome: '')
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all imagens as @imagens" do
      imagem = FactoryGirl.create(:imagem)
      get :index, params: {}, session: valid_session
      expect(assigns(:imagens)).to eq([imagem])
    end
  end

  describe "GET #show" do
    it "assigns the requested imagem as @imagem" do
      imagem = FactoryGirl.create(:imagem)
      get :show, params: {id: imagem.to_param}, session: valid_session
      expect(assigns(:imagem)).to eq(imagem)
    end
  end

  describe "GET #new" do
    it "assigns a new imagem as @imagem" do
      get :new, params: {}, session: valid_session
      expect(assigns(:imagem)).to be_a_new(Imagem)
    end
  end

  describe "GET #edit" do
    it "assigns the requested imagem as @imagem" do
      imagem = FactoryGirl.create(:imagem)
      get :edit, params: {id: imagem.to_param}, session: valid_session
      expect(assigns(:imagem)).to eq(imagem)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Imagem" do
        expect {
          post :create, params: {imagem: valid_attributes}, session: valid_session
        }.to change(Imagem, :count).by(1)
      end

      it "assigns a newly created imagem as @imagem" do
        post :create, params: {imagem: valid_attributes}, session: valid_session
        expect(assigns(:imagem)).to be_a(Imagem)
        expect(assigns(:imagem)).to be_persisted
      end

      it "redirects to the created imagem" do
        post :create, params: {imagem: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Imagem.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved imagem as @imagem" do
        post :create, params: {imagem: invalid_attributes}, session: valid_session
        expect(assigns(:imagem)).to be_a_new(Imagem)
      end

      it "re-renders the 'new' template" do
        post :create, params: {imagem: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:imagem) { FactoryGirl.create(:imagem) }
      let(:dados_validos) { FactoryGirl.attributes_for(:imagem, nome: 'Novo Nome') }

      it "updates the requested imagem" do
        put :update, params: { id: imagem.id, imagem: dados_validos, session: valid_session }
        imagem.reload
        expect(imagem.nome).to eq('Novo Nome')
      end

      it "assigns the requested imagem as @imagem" do
        put :update, params: {id: imagem.to_param, imagem: valid_attributes}, session: valid_session
        expect(assigns(:imagem)).to eq(imagem)
      end

      it "redirects to the imagem" do
        put :update, params: {id: imagem.to_param, imagem: valid_attributes}, session: valid_session
        expect(response).to redirect_to(imagem)
      end
    end

    context "with invalid params" do
      it "assigns the imagem as @imagem" do
        imagem = Imagem.create! valid_attributes
        put :update, params: {id: imagem.to_param, imagem: invalid_attributes}, session: valid_session
        expect(assigns(:imagem)).to eq(imagem)
      end

      it "re-renders the 'edit' template" do
        imagem = Imagem.create! valid_attributes
        put :update, params: {id: imagem.to_param, imagem: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested imagem" do
      imagem = Imagem.create! valid_attributes
      expect {
        delete :destroy, params: {id: imagem.to_param}, session: valid_session
      }.to change(Imagem, :count).by(-1)
    end

    it "redirects to the imagens list" do
      imagem = Imagem.create! valid_attributes
      delete :destroy, params: {id: imagem.to_param}, session: valid_session
      expect(response).to redirect_to(imagens_url)
    end
  end

end
