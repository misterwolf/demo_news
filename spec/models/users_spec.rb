describe User, type: :model do
  let(:user) { double(id: 1) }

  it { is_expected.to have_many(:news) }
end
