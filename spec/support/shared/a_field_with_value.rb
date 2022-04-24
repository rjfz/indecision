RSpec.shared_context 'a field with value' do |record, field, value, label: true|
  before { render_inline(subject) }

  if label
    it 'renders the field label' do
      expect(rendered_component).to have_text field.to_s.humanize
    end
  end

  if value
    it 'renders the field' do
      expect(rendered_component).to have_field("#{record}[#{field}]", with: value)
    end
  end
end
