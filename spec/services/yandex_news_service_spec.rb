require "rails_helper"

RSpec.describe YandexNewsService do
  context 'attr accessors' do
    subject { described_class.new.perform }

    before do
      allow_any_instance_of(YandexNewsService).to receive(:send_request).and_return(YANDEX_NEWS_RESPONSE)
    end

    let(:ya_news) { YandexNewsItem.new }

    it { expect(subject[:title]).to eq ya_news.title }
    it { expect(subject[:description]).to eq ya_news.description }
    it { expect(subject[:created_at]).to eq ya_news.created_at }
  end
end