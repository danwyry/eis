Given(/^no hice operaciones$/) do
  visit '/'
end

Given(/^hago una suma$/) do
  visit '/'
  fill_in 'operando', with: '1'
  click_button 'otro_operando'
  fill_in 'operando', with: '2'
  click_button 'suma'
end

Given(/^hago una resta$/) do
  fill_in 'operando', with: '4'
  click_button 'otro_operando'
  fill_in 'operando', with: '2'
  click_button 'resta'
end

Then(/^la cantidad de operaiones es (\d+)$/) do | cantidad |
  with_scope('span#cant_operaciones') do
    expect(page.text).to eq cantidad.to_s
  end
end

Given(/^reseteo la memoria$/) do
  click_button 'limpiar_memoria'# Write code here that turns the phrase above into concrete actions
end


