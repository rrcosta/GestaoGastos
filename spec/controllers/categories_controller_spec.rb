require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      category = Category.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      category = Category.create! valid_attributes
      get :show, params: {id: category.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Category" do
        expect {
          post :create, params: {category: valid_attributes}, session: valid_session
        }.to change(Category, :count).by(1)
      end

      it "renders a JSON response with the new category" do

        post :create, params: {category: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(category_url(Category.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new category" do

        post :create, params: {category: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested category" do
        category = Category.create! valid_attributes
        put :update, params: {id: category.to_param, category: new_attributes}, session: valid_session
        category.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the category" do
        category = Category.create! valid_attributes

        put :update, params: {id: category.to_param, category: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the category" do
        category = Category.create! valid_attributes

        put :update, params: {id: category.to_param, category: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested category" do
      category = Category.create! valid_attributes
      expect {
        delete :destroy, params: {id: category.to_param}, session: valid_session
      }.to change(Category, :count).by(-1)
    end
  end

end
