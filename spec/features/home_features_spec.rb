require 'rails_helper'

feature 'Home', type: :feature, use_truncation: true do
  context '通常アクセス' do
    scenario '正常' do
      visit '/'
      expect(current_path).to eq '/'
      sleep 10

      expect(page).to have_content('TOP')
    end
  end
end
