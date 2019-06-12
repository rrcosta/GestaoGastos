require 'rails_helper'

RSpec.describe ExpensesController, type: :controller do

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      expense = Expense.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      expense = Expense.create! valid_attributes
      get :show, params: {id: expense.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Expense" do
        expect {
          post :create, params: {expense: valid_attributes}, session: valid_session
        }.to change(Expense, :count).by(1)
      end

      it "renders a JSON response with the new expense" do

        post :create, params: {expense: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(expense_url(Expense.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new expense" do

        post :create, params: {expense: invalid_attributes}, session: valid_session
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

      it "updates the requested expense" do
        expense = Expense.create! valid_attributes
        put :update, params: {id: expense.to_param, expense: new_attributes}, session: valid_session
        expense.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the expense" do
        expense = Expense.create! valid_attributes

        put :update, params: {id: expense.to_param, expense: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the expense" do
        expense = Expense.create! valid_attributes

        put :update, params: {id: expense.to_param, expense: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested expense" do
      expense = Expense.create! valid_attributes
      expect {
        delete :destroy, params: {id: expense.to_param}, session: valid_session
      }.to change(Expense, :count).by(-1)
    end
  end

end
