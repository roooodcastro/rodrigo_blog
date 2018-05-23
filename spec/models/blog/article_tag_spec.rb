RSpec.describe Blog::ArticleTag do
  subject { article_tag }

  let(:article_tag) { FactoryBot.build :blog_article_tag }

  it { is_expected.to be_valid }

  describe 'Associations' do
    it { is_expected.to belong_to :article }
    it { is_expected.to belong_to :tag }
  end
end
