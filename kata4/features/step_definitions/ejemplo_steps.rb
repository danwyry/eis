Given(/^voy a la pagina de saludo$/) do
  visit 'saludo'
end

When(/^pongo mi nombre 'juan'$/) do
  fill_in 'nombre', with: 'juan'
  click_button('enviar')
end

Then(/^me dice 'hola juan'$/) do
  expect(page).to have_content('hola juan')
end
