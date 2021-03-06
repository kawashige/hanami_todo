require_relative '../../../spec_helper'

describe Web::Views::Todos::Create do
  let(:exposures) { Hash[format: :html] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/todos/create.html.erb') }
  let(:view)      { Web::Views::Todos::Create.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #format' do
    view.format.must_equal exposures.fetch(:format)
  end
end
