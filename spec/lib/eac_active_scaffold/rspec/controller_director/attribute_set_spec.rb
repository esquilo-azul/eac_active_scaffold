# frozen_string_literal: true

RSpec.describe EacActiveScaffold::Rspec::ControllerDirector::AttributeSet do
  let(:person_name) { 'Fulano de Tal' }

  describe '#value' do
    it 'returns a static value' do
      expect(described_class.new(nil, self, :name, 'Outro').value).to eq('Outro')
    end

    it 'evaluates a callable value in the example context' do
      expect(described_class.new(nil, self, :name, -> { person_name }).value).to eq(person_name)
    end
  end
end
