module RainbowVital
  module ApplicationHelper
    def link_to_add_fields(name, form, association, target, partial)
      new_object = form.object.class.reflect_on_association(association).klass.new
      fields = form.fields_for(association, new_object, child_index: 'new_supplement_plan_item') do |builder|
        render(partial, item_form: builder)
      end
      link_to(name, '#', class: 'add-fields', data: { target: target, fields: fields.gsub("\n", "") })
    end
  end
end
