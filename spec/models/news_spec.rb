describe News, type: :model do
  let(:user) { double(id: 1) }

  it { is_expected.to belong_to(:author).class_name('User') }

  # we could use some shared example too -->

  describe 'scopes' do
    let(:not_evaluable) { 'not-evaluable' }

    describe '.filter_by_author' do
      let(:name) { 'a-test-name' }
      let(:common) { 'test' }
      let(:single) { 'single-field' }
      let(:cannot_match) { 'not-exist' }
      let(:user) do
        create(:user, name: name, lastname: 'test-lastname')
      end
      let!(:news1) { create(:news, title: 'title-test', content: not_evaluable, author: user) }
      let!(:news2) { create(:news, content: 'content-test', title: not_evaluable, author: user) }
      let!(:news3) { create(:news, title: 'title-test', content: not_evaluable) }
      let!(:news4) { create(:news, title: common, content: 'content-test') }
      let!(:news5) { create(:news, title: single, content: not_evaluable) }

      context 'common value in fields' do
        it 'returns filtered news' do
          expect(described_class.filter_by_author(name).to_a).to match_array(
            [news1, news2]
          )
        end
      end

      context 'no match criteria' do
        it 'returns filtered news' do
          expect(described_class.filter_by_author('user-not-exist').to_a).to eq([])
        end
      end
    end

    describe '.filter_on_author_content_title' do
      let(:common) { 'test' }
      let(:single) { 'single-field' }
      let(:cannot_match) { 'not-exist' }
      let(:user) do
        create(:user, name: 'test-name', lastname: 'test-lastname')
      end
      let!(:news1) { create(:news, title: 'title-test', content: not_evaluable, author: user) }
      let!(:news2) { create(:news, content: 'content-test', title: not_evaluable, author: user) }
      let!(:news3) { create(:news, title: 'title-test', content: not_evaluable) }
      let!(:news4) { create(:news, title: common, content: 'content-test') }
      let!(:news5) { create(:news, title: single, content: not_evaluable) }

      context 'common value in fields' do
        it 'returns filtered news' do
          expect(described_class.filter_on_author_content_title(common).to_a).to match_array(
            [news1, news2, news3, news4, news5]
          )
        end
      end

      context 'just one value in fields' do
        it 'returns filtered news' do
          expect(described_class.filter_on_author_content_title(single).to_a).to eq([news5])
        end
      end

      context 'no match criteria' do
        it 'returns filtered news' do
          expect(described_class.filter_on_author_content_title(cannot_match).to_a).to eq([])
        end
      end
    end
  end
end
