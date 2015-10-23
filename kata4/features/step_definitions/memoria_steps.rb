Given(/^no hice operaciones$/) do
  visit '/'
end

Then(/^la cantidad de operaiones es (\d+)$/) do | cantidad |
  with_scope('span#cant_operaciones') do
    expect(page.text).to eq cantidad.to_s
  end
end

