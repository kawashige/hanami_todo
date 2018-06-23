
require_relative '../../../spec_helper'

describe Web::Controllers::Todos::Create do
  let(:action) { Web::Controllers::Todos::Create.new }
  let(:repository) { TodoRepository.new }

  before do
    repository.clear
  end

  describe 'with valid params' do
    let(:params) { Hash[todo: { name: 'Cleaning', due_date: '2018-07-01' }] }

    it 'creates a todo' do
      action.call(params)
      todo = repository.last

      todo.id.wont_be_nil
      todo.name.must_equal params.dig(:todo, :name)
    end

    it 'redirects the user to the todos listing' do
      response = action.call(params)

      response[0].must_equal 302
      response[1]['Location'].must_equal '/todos'
    end
  end

  describe 'with invalid params' do
    let(:params) { Hash[todo: {}] }

    it 'returns HTTP client error' do
      response = action.call(params)
      response[0].must_equal 422
    end

    it 'dumps errors in params' do
      action.call(params)
      errors = action.params.errors

      errors.dig(:todo, :name).must_equal  ['is missing']
      errors.dig(:todo, :due_date).must_equal ['is missing']
    end
  end
end
