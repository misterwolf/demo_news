# frozen_string_literal: true

feature 'News#edit', :js do
  let(:content) { 'content' }
  let(:title) { 'title' }
  let(:user) { create(:user) }
  let!(:news1) { create(:news, content: "news1-#{content}", title: "news1-#{title}", author: user, created_at: Time.now - 2.month, updated_at: Time.now  - 1.month) }

  before do
    sign_in user

    visit edit_news_path(news1)
  end

  it 'shows edit button when user is owner' do
    expect(page).to have_button('Edit News')
  end
end
