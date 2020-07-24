# frozen_string_literal: true

feature 'News#search', :js do
  let(:content) { 'content' }
  let(:title) { 'title' }
  let(:user) { create(:user) }
  let!(:news1) { create(:news, content: "news1-#{content}", title: "news1-#{title}", author: user) }
  let!(:news2) { create(:news, content: "news2-#{content}", title: "news2-#{title}", author: user) }

  context 'search criteria is not found' do
    it 'shows all news' do
      visit search_news_index_path # => nil

      expect(page).to have_content("news1-#{content}")
      expect(page).to have_content("news2-#{content}")
      expect(page).to have_content("news1-#{title}")
      expect(page).to have_content("news2-#{title}")
    end

    it 'shows message news' do
      visit search_news_index_path(search: 'new.test')

      expect(page).to have_content('The search did not return any results. Try again.')
    end
  end

  context 'search criteria is found' do
    it 'shows the searched item' do
      visit search_news_index_path(search: 'news1')

      expect(page).to have_content("news1-#{content}")
      expect(page).to have_content("news1-#{title}")
    end
  end
end
