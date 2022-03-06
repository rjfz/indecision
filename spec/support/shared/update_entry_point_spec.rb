# frozen_string_literal: true

RSpec.shared_examples 'update entrypoint' do |model|
  it 'does not raise an error' do
    expect { subject }.not_to raise_error
  end

  it 'does not create a new record' do
    expect { subject }.not_to change(model, :count)
  end
end
