require "rails_helper"

RSpec.describe 'NewsItemCreateFeature' do
  describe "with nonexpired news item", type: :feature do
    let!(:news_item) { create :news_item }

    it do
      visit admin_path

      expect(page.find('#news_item_title')[:value]).to eq news_item.title
      expect(page.find('#news_item_description')[:value]).to eq news_item.description
      expect(page.find('#news_item_expire_at')[:value]).to eq news_item.expire_at.strftime('%Y-%m-%dT%H:%M:%S')
    end
  end

  describe "with NO news item", type: :feature do
    it do
      visit admin_path

      expect(page.find('#news_item_title')[:value]).to be_nil
      expect(page.find('#news_item_description')[:value]).to be_nil
      expect(page.find('#news_item_expire_at')[:value]).to eq Time.now.strftime('%Y-%m-%dT%H:%M:%S')
    end
  end
end
