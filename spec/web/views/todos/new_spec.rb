require_relative '../../../spec_helper'

describe Web::Views::Todos::New do
  let(:params)    { OpenStruct.new(valid?: false, error_messages: ['Name must be filled', 'Due Date must be filled']) }
  let(:exposures) { Hash[params: params] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/todos/new.html.erb') }
  let(:view)      { Web::Views::Todos::New.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'displays list of errors when params contains errors' do
    rendered.must_include('There was a problem with your submission')
    rendered.must_include('Name must be filled')
    rendered.must_include('Due Date must be filled')
  end
end
