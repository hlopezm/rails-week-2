require 'spec_helper'

feature 'Event creation' do

  scenario 'creating an event', driver: :selenium do

    visit new_event_path
    
    fill_in "event_name", with: "Evento de prueba"
    fill_in "description", with: "Eam omnium iuvaret at, eu brute fierent oportere mei, ornatus officiis interpretaris ut vim. Cotidieque persequeris ea sed. Quod principes molestiae quo ei, eum aliquid legimus facilis ut. Ad prima dicam sed, prima aeque adversarium cu sit, mea ex quem accusam. Tibique intellegebat no pro, vim brute deseruisse et. Ei nam stet nulla, pri nobis choro at."

    fill_in "start_at", with: "01/01/2014"
    fill_in "end_at", with: "02/02/2014"

    click_button "Save"

    save_and_open_page
    
    page.should_have_content "Evento de prueba"

    sleep 10

  end
end
