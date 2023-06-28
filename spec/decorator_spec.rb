require_relative '../Person/decorator'
require_relative '../Person/nameable'

describe Nameable do
  it 'raises NotImplementedError when correct_name is called' do
    nameable = Nameable.new
    expect { nameable.correct_name }.to raise_error(NotImplementedError)
  end
end

describe Decorator do
  it 'delegates correct_name to the decorated object' do
    decorated_object = double('decorated_object')
    allow(decorated_object).to receive(:correct_name).and_return('John Doe')

    decorator = Decorator.new(decorated_object)
    expect(decorator.correct_name).to eq('John Doe')
  end
end

describe CapitalizeDecorator do
  it 'capitalizes the name returned by the decorated object' do
    decorated_object = double('decorated_object')
    allow(decorated_object).to receive(:correct_name).and_return('john doe')

    decorator = CapitalizeDecorator.new(decorated_object)
    expect(decorator.correct_name).to eq('John doe')
  end
end

describe TrimmerDecorator do
  it 'trims the name returned by the decorated object if it exceeds 10 characters' do
    decorated_object = double('decorated_object')
    allow(decorated_object).to receive(:correct_name).and_return('John Doe Smith')

    decorator = TrimmerDecorator.new(decorated_object)
    expect(decorator.correct_name).to eq('John Doe S')
  end

  it 'does not trim the name returned by the decorated object if it does not exceed 10 characters' do
    decorated_object = double('decorated_object')
    allow(decorated_object).to receive(:correct_name).and_return('John Doe')

    decorator = TrimmerDecorator.new(decorated_object)
    expect(decorator.correct_name).to eq('John Doe')
  end
end
