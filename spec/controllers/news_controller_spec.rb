# frozen_string_literal: true

describe NewsController, type: :request do # :request instead of :controller as suggested from RoR self
  let(:test_name) { 'uniq-name' }
  let(:user) do
    create(:user, name: test_name, lastname: 'test-lastname')
  end

  let(:user2) do
    create(:user, name: test_name, lastname: 'test-lastname')
  end

  let!(:news1) { create(:news, title: 'title-test', content: 'test-content', author: user) }
  let!(:news2) { create(:news, title: 'test', content: 'test-content') }

  describe 'GET index' do
    let(:params) { nil }

    it 'responds correctly' do
      get news_index_path

      expect(response).to have_http_status(200)
    end
  end

  describe 'GET search' do
    let(:params) { { value: 'test_name' } }

    it 'redirects and responds succesfully' do
      get search_news_index_path(params: params)

      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end
  end

  describe 'GET edit' do
    let(:params) { { title: 'test-title', content: 'test-content' } }

    it 'redirects to root if user is not owner' do
      sign_in user

      get edit_news_path(news2)

      expect(response).to have_http_status(302)
      expect(response).to redirect_to(action: :index)
    end

    it 'redirects to root if user is not logged' do
      get edit_news_path(news1)

      expect(response).to have_http_status(302)
      expect(response).to redirect_to(action: :index)
    end
  end

  describe 'GET new' do
    let(:params) { { title: 'test-title', content: 'test-content' } }

    it 'redirects and responds succesfully' do
      sign_in user

      get new_news_path

      expect(response).to have_http_status(200)
    end
  end

  describe 'DELETE destroy' do
    let(:params) { { title: 'test-title', content: 'test-content' } }

    it 'redirects and responds succesfully' do
      sign_in user

      expect { delete news_path(news1) }.to change { News.count }.by(-1)
    end

    context 'user is not owner' do
      it 'redirects and responds succesfully' do
        sign_in user2

        delete news_path(news1)

        expect(response).to have_http_status(302)
        expect(response).to redirect_to(action: :index)
      end
    end

    context 'user is not logged' do
      it 'redirects and responds succesfully' do
        delete news_path(news1)
        
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(action: :index)
      end
    end
  end

  describe 'POST create' do
    let(:params) { { title: 'test-title', content: 'test-content' } }

    it 'redirects and responds succesfully' do
      sign_in user

      post '/news', news: params

      expect(response).to have_http_status(302)
      expect(response).to redirect_to(action: :show, id: assigns(:single_news).id)
    end

    context 'bad data' do
      let(:params) { { title: 'test-title' } }

      it 'redirects to new' do
        sign_in user

        post '/news', news: params

        expect(response).to have_http_status(200)
        expect(response).to render_template(:new)
      end
    end
  end
end
