feature 'Attack' do

  describe 'when player 1 attacks player 2' do

    before(:each) do
      sign_in_and_play
      click_button 'Attack'
    end
    scenario "show a confirmation message of the attack" do
      expect(page).to have_content "Ben attacked Leonidas!"
    end

    scenario "switch the turn" do
      click_button 'OK'
      expect(page).to have_content "It's Leonidas's turn"
    end

    scenario "reduce player 2's hit points by 10" do
      click_button 'OK'
      expect(page).not_to have_content 'Leonidas: 60 HP'
      expect(page).to have_content 'Leonidas: 50 HP'
    end
  end

  describe "when it's player 2's turn, and player 2 attacks player 1" do
    before(:each) do
      sign_in_and_play
      click_button 'Attack'
      click_button 'OK'
    end

    scenario "show it's player 2 turn" do
      expect(page).to have_content "It's Leonidas's turn"
    end
  
    scenario 'display a confirmation message of the attack' do
      click_button 'Attack'
      expect(page).to have_content "Leonidas attacked Ben!"
    end

    scenario "reduce Player 1 HP by 10 " do
      click_button 'Attack'
      click_button 'OK'
      expect(page).not_to have_content 'Ben: 60 HP'
      expect(page).to have_content 'Ben: 50 HP'
    end

    scenario "be player 1's turn after the attack" do
      click_button 'Attack'
      click_button 'OK'
      expect(page).to have_content "It's Ben's turn"
    end
  end
end