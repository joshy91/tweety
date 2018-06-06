require 'rails_helper'

RSpec.describe TweetsController, type: :controller do

	include Devise::Test::ControllerHelpers
	
  #let(:user) { build(:user) }
  before :each do
    user = create(:user)
    sign_in user
  end

  describe "GET #index" do
		it 'renders the tweets index template' do
      get :index
      expect(response).to render_template(:index)
      #response represents the finished product from our controller action
    end

    it 'returns all tweets' do
      get :index
      expect(assigns(:tweets)).not_to be_nil
    end
	end

  describe "GET #show" do
    it 'assigns the show template' do
      tweet = create(:goodmorning)
      get :show, params: { id: tweet.to_param }
      expect(response).to render_template(:show)
    end

    it 'assigns the requested tweet as @tweet' do
      tweet = create(:goodevening)
      get :show, params: { id: tweet.to_param }
      expect(assigns(:tweet)).to eq(tweet)
    end
  end

  describe 'GET #new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
    it 'assigns a new tweet to @tweet' do
      get :new
      expect(assigns(:tweet)).to be_a_new(Tweet)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested tweet as @tweet' do
      tweet = create(:goodmorning)
      get :edit, params: { id: tweet.to_param }
      expect(assigns(:tweet)).to eq(tweet)
    end
    it 'assigns the edit template' do
      tweet = create(:goodevening)
      get :edit, params: { id: tweet.to_param }
      expect(response).to render_template(:edit)
    end
  end

end