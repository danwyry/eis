Given(/^entro a la calculadora$/) do
  visit '/'
end

Given(/^un operando es (\d+)$/) do |arg1|
  fill_in 'operando', with: arg1
end

Given(/^otro operando es (\d+)$/) do |arg1|
  click_button 'otro_operando'
  fill_in 'operando', with: arg1
end

When(/^los sumo$/) do
  click_button 'suma'
end

Then(/^el resultado es (\d+)$/) do |arg1|
  @campo = find_field('resultado')
  expect(@campo.value.to_i).to eq arg1.to_i
end

