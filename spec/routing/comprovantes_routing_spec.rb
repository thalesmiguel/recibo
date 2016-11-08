require "rails_helper"

RSpec.describe ComprovantesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/comprovantes").to route_to("comprovantes#index")
    end

    it "routes to #new" do
      expect(:get => "/comprovantes/new").to route_to("comprovantes#new")
    end

    it "routes to #show" do
      expect(:get => "/comprovantes/1").to route_to("comprovantes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/comprovantes/1/edit").to route_to("comprovantes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/comprovantes").to route_to("comprovantes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/comprovantes/1").to route_to("comprovantes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/comprovantes/1").to route_to("comprovantes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/comprovantes/1").to route_to("comprovantes#destroy", :id => "1")
    end

  end
end