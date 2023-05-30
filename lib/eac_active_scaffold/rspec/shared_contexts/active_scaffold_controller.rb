# frozen_string_literal: true

::RSpec.shared_context 'active_scaffold_controller' do |options|
  let(:index_path) { options.fetch(:index_path) }
  let(:model) { options.fetch(:model) }

  before do
    visit index_path
  end

  it 'show index page' do
    expect(page).to have_content model.model_name.human(count: 2)
  end

  it 'create new record' do
    expect do
      click_on ::I18n.t('active_scaffold.create_new')
      options.fetch(:valid).each do |key, value|
        fill_in model.human_attribute_name(key), with: value
      end
      click_on ::I18n.t('active_scaffold.create')
    end.to change { model.count }.by(1)
  end
end
