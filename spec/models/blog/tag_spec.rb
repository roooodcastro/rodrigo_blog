RSpec.describe Blog::Tag do
  subject { tag }

  let(:tag) { FactoryBot.build :blog_tag }

  it { is_expected.to be_valid }

  describe 'Associations' do
    it { is_expected.to have_many :article_tags }
    it { is_expected.to have_many(:articles).through(:article_tags) }
  end
end
