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

  describe "POST #create" do
    let(:user) { create(:user) }
    let(:valid_attributes) { attributes_for(:goodmorning) }
    let(:invalid_attributes) { attributes_for(:invalid_tweet) }
    context "with valid attributes" do
      it 'persists new tweet' do
        expect {
          post :create, params: { tweet: valid_attributes }
        }.to change(Tweet, :count).by(1)
      end
      it 'redirects to show page' do
        post :create, params: { tweet: valid_attributes }
        expect(response).to redirect_to(assigns(:tweet))
      end
    end
    context 'with invalid attributes' do
      it 'does not persist tweet' do
        expect{
          post :create, params: {tweet: invalid_attributes}
        }.not_to change(Tweet, :count)
      end
      it 're-renders :new template' do
        post :create, params: { tweet: invalid_attributes }
        expect(response).to render_template(:new)
      end
    end
  end

describe '#PATCH #update' do
  let(:tweet) { create(:goodmorning)}
  let(:new_attributes) { attributes_for(:goodevening) }
  let(:invalid_attributes) { attributes_for(:invalid_tweet) }

  context 'with valid params' do
  	it 'updates the selected tweet' do
  		patch :update, params: { id: tweet.to_param, tweet: new_attributes }
  		tweet.reload
  		expect(tweet.message).to eql('Good Evening')
  		expect(tweet.user_id).to eql(1)
	end

	it 'redirects to the tweet' do 
		patch :update, params: { id: tweet.to_param, tweet: new_attributes }
		tweet.reload
		expect(response).to redirect_to(tweet)
	end
end
	context 'with invalid params' do
		it 'does not update the tweet' do 
			patch :update, params: {id: tweet.to_param, tweet: invalid_attributes}
			expect(assigns(:tweet)).to eq(tweet)
		end

		it 're-renders the edit template' do
			patch :update, params: {id: tweet.to_param, tweet: invalid_attributes}
			expect(response).to render_template(:edit)
		end
	end
end
end

