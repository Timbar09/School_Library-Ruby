require_relative './all_methods'

describe Nameable do
  context 'when correct_name is called on a Nameable object' do
    nameable = Nameable.new

    it 'raises a NotImplementedError' do
      expect { nameable.correct_name }.to raise_error(NotImplementedError)
    end
  end
end