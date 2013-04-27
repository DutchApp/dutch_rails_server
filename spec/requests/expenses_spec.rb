require 'spec_helper'

describe "Expenses" do
  describe "New Expense" do
    it "should display new expense form" do
      get expenses_new_path
      expect(response).to render_template(:new)
    end
  end
end
