RSpec.shared_context 'log in as a user', shared_context: :metadata do |permissions|
  let(:role) { create(:role, name: 'staff') }
  let(:user) { create(:user, role: role) }

  before do
    permissions.each do |resource, actions|
      actions.each do |action|
        create(:role_permission, role: role, resource: resource.to_s, action: action.to_s)
      end
    end

    login_as(user)
  end
end

RSpec.configure do |rspec|
  rspec.include_context 'log in as a user', include_shared: true
end
