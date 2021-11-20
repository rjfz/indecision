RSpec.shared_examples 'create entrypoint' do |model|
  it 'does not raise an error' do
   expect { subject }.not_to raise_error
  end

  it 'creates a new record' do
    expect {subject }.to change(model, :count).by 1
  end
end
