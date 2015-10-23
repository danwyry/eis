Given(/^un operando es (\d+)$/) do |arg1|
  visit '/'
  fill_in 'operando', with: arg1
end

Given(/^otro operando es (\d+)$/) do |arg1|
  click_button 'otro_operando'
  fill_in 'operando', with: arg1
end

Given(/^no hay operandos$/) do
  visit '/'
end


When(/^los sumo$/) do
  click_button 'suma'
end

When(/^los resto$/) do
  click_button 'resta'
end

When(/^calculo el promedio$/) do
  click_button 'promedio'
end

Then(/^resulta un error de calculo$/) do
  expect(page).to have_content('Error de calculo')
end


Then(/^el resultado es (\d+)$/) do |arg1|
  @campo = find_field('resultado')
  expect(@campo.value.to_i).to eq arg1.to_i
end

