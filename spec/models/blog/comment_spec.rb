RSpec.describe Blog::Comment do
  subject { comment }

  let(:comment) { FactoryBot.build :blog_comment }

  it { is_expected.to be_valid }

  describe 'Associations' do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :commentable }
    it { is_expected.to belong_to :article }
    it { is_expected.to belong_to :parent }
  end
end