# frozen_string_literal: true

require 'eac_active_scaffold/rspec/controller_director'

::RSpec.shared_context 'active_scaffold_controller' do |options|
  director = ::EacActiveScaffold::Rspec::ControllerDirector.new(self, options)

  before do
    visit director.index_path
  end

  it 'show index page' do
    expect(page).to have_content director.page_title
  end

  context 'when record is created' do
    let(:before_create_count) { director.model_class.count }

    before do
      before_create_count
      click_on ::I18n.t('active_scaffold.create_new')
      director.valid_create_data.each do |key, value|
        fill_in director.attribute_label(key), with: value
      end
      click_on ::I18n.t('active_scaffold.create')
    end

    it 'increments record count' do
      expect(director.model_class.count).to eq(before_create_count + 1)
    end
  end
end
