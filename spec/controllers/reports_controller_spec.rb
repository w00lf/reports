require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe ReportsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Campaign. As you add validations to Campaign, be sure to
  # adjust the attributes here as well.
  let(:report) { FactoryGirl.create(:report) }
  let(:campaign) { FactoryGirl.create(:campaign) }

  shared_examples "authorized request" do |request, params|
    it "Returns redirect to login page" do
      report
      get request, params
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  context 'With unlogined user' do
    %i{index new }.each do |type|
      it_behaves_like "authorized request", type, {}
    end
  end

  context 'With logined user' do
    login_user

    describe "GET #index" do
      it "Returns success" do
        get :index
        expect(response).to be_success
      end

      it "assigns reports" do
        report
        get :index
        expect(assigns(:reports)).to eq([report])
      end
    end

    describe "GET #new" do
      it "assigns a new campaign as @campaign" do
        get :new
        expect(assigns(:report)).to be_a_new(Report)
      end
    end

    describe "POST #create" do
      let(:valid_attributes) {
        { report: { campaign_id: campaign.id } }
      }

      let(:invalid_attributes) {
        { report: { campaign_id: campaign.id + 1000 } }
      }
      context 'With valid attributes' do
        it "It creates report" do
          expect{
            post :create, valid_attributes
          }.to change(Report, :count)
        end

        it "It creates pdf attachment to report" do
          post :create, valid_attributes
          expect(assigns(:report).pdf).to be_present
        end

        it "It creates report on json call" do
          expect{
            post :create, valid_attributes.merge(format: :json)
          }.to change(Report, :count)
        end

        it "It returns valid json on json create request" do
          post :create, valid_attributes.merge(format: :json)
          JSON::Validator.validate!("#{Rails.root}/spec/support/api/schemas/report.json", response.body)
        end
      end

      context 'With invalid attributes' do
        it "Does not creates report" do
          expect{
            post :create, invalid_attributes
          }.to_not change(Report, :count)
        end
      end
    end
  end
end
