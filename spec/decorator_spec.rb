require_relative 'all_methods'

describe Decorator do
  context 'when a person\'s name is decorated with CapitalizeDecorator' do
    jimmy = Person.new(1, 20, 'jimmy')
    jimmy = CapitalizeDecorator.new(jimmy)

    it 'returns the name capitalized' do
      expect(jimmy.correct_name).to eq('Jimmy')
    end
  end

  context 'when a person\'s name is decorated with TrimmerDecorator' do
    jimmy = Person.new(1, 20, 'jimmythebestofall')
    jimmy = TrimmerDecorator.new(jimmy)

    it 'returns the name trimmed' do
      expect(jimmy.correct_name).to eq('jimmythebe...')
    end
  end
end