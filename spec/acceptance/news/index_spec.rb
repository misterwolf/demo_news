# frozen_string_literal: true

feature 'News#index', :js do
  let(:content) { 'content' }
  let(:title) { 'title' }
  let(:user) { create(:user) }
  let(:user1) { create(:user) }
  let!(:news1) { create(:news, content: "news1-#{content}", title: "news1-#{title}", author: user, created_at: Time.now - 2.month, updated_at: Time.now  - 1.month) }
  let!(:news2) { create(:news, content: "news2-#{content}", title: "news2-#{title}", author: user, created_at: Time.now - 1.month, updated_at: Time.now  - 15.days) }
  let!(:news3) { create(:news, content: "news3-#{content}", title: "news3-#{title}", author: user1, created_at: Time.now, updated_at: Time.now  - 15.days) }
  let(:test_results) do
    {
      order_created_at_desc: [news1.title, news2.title, news3.title],
      order_updated_at_asc: [news3.title, news2.title, news1.title],
      order_updated_at_desc: [news1.title, news2.title, news3.title],
      order_created_at_asc: [news3.title, news2.title, news1.title]
    }
  end

  SORTING = {
    order_created_at_desc: 'Created At Desc',
    order_updated_at_asc: 'Updated At Asc',
    order_updated_at_desc: 'Updated At Desc',
    order_created_at_asc:  'Created At Asc'
  }.freeze

  before do
    visit news_index_path
  end

  def select_sorting(sorting)
    find(".sort-select[value='#{sorting}']").click
  end

  def click_on_submit
    find('.search-submit').click
  end

  it 'shows all news title and content' do
    expect(page).to have_content("news1-#{content}")
    expect(page).to have_content("news2-#{content}")
    expect(page).to have_content("news1-#{title}")
    expect(page).to have_content("news2-#{title}")

    expect(page).to have_content('View News details »', count: 3)
  end

  it "don't run the search if field is empty" do
    message = page.accept_alert 'Fill search input.' do
      click_on_submit
    end

    expect(message).to eq('Fill search input.')
  end

  it 'filters results' do
    fill_in 'filter-input', with: 'news2'

    expect(page).not_to have_content("news1-#{content}")
    expect(page).to have_content("news2-#{content}")
  end

  context '#sorting' do

    # NOTE: Sorter Class should be tested also with Jasmine!
    # let's be with it for now.
    it 'sorting results' do
      SORTING.each do |k, v|
        select v, from: 'select-sorting'

        # we should use orderly gem, but let's go head
        expect(page.all('.news-item h2').collect(&:text)).to eq(test_results[k])
      end
    end
  end

  context 'logged user' do
    before do
      sign_in user
    end

    it 'shows all news title and content' do
      expect(page).to have_content('Edit News »', count: 2)
    end
  end
end
