require '~/documents/projects/oystercard/lib/oystercard'

# describe 'Feature Tests' do
#   it "Run feature tests" do

    oystercard = Oystercard.new
    oystercard.top_up(20)
    oystercard.journey_history
    oystercard.touch_in("Brixton")
    oystercard.touch_out("Camden Town")
    oystercard.journey_history

    oystercard.touch_in("Brixton")
    oystercard.touch_out("Camden Town")
    oystercard.journey_history




#   end
# end
