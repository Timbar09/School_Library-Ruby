require_relative 'all_methods'

describe Classroom do
    context 'when creating a new classroom' do
        classroom = Classroom.new('Math')

        it 'should have a label' do
            expect(classroom.label).to eql('Math')
        end

        it 'should have no students' do
            expect(classroom.students).to eql([])
        end

    end
end