RSpec.describe Blog::Article do
  subject { article }

  let(:article) { FactoryBot.build :blog_article }

  it { is_expected.to be_valid }

  describe 'Associations' do
    it { is_expected.to belong_to :author }
    it { is_expected.to have_many :comments }
    it { is_expected.to have_many :article_tags }
    it { is_expected.to have_many(:tags).through(:article_tags) }
  end
end
