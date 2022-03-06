# frozen_string_literal: true

RSpec.shared_examples 'destroy entrypoint' do |model|
  it 'does not raise an error' do
    expect { subject }.not_to raise_error
  end

  it 'deletes a record' do
    expect { subject }.to change(model, :count).by(-1)
  end
end
