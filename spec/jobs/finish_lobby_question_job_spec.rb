require 'rails_helper'

RSpec.describe FinishLobbyQuestionJob do
  subject { described_class.new.perform(lobby_question) }

  let(:lobby) { create(:lobby, state: 'started') }
  let(:anon_user1) { create(:anon_user, username: 'first first')}
  let(:anon_user2) { create(:anon_user, username: 'goofy mcgoof') }
  let(:anon_user3) { create(:anon_user, username: 'jesus mcjesus') }
  let(:question) { create(:question, title: 'joe who is', time_limit: 30) }
  let(:question2) { create(:question, title: 'quickfire', time_limit: 0) }
  let(:answer1) { create(:answer, value: 'correct', correct: true, question: question) }
  let(:answer2) { create(:answer, value: 'wrong', correct: false, question: question) }
  let(:quickfireanswer1) { create(:answer, value: 'correct', correct: true, question: question2)}
  let(:quickfireanswer2) { create(:answer, value: 'wrong', correct: false, question: question2)}
  let(:lobby_question) { create(:lobby_question, started_at: Time.now, state: 'started', question: question, lobby: lobby) }
  let(:lobby_question2) { create(:lobby_question, started_at: Time.now, state: 'started', question: question2, lobby: lobby) }

  context 'when a single correct answer is supplied' do
    let(:response1) { create(:response, answer: answer1, anon_user: anon_user1, lobby_question: lobby_question)}
    let(:response2) { create(:response, answer: answer2, anon_user: anon_user2, lobby_question: lobby_question)}
    let(:response3) { create(:response, answer: answer2, anon_user: anon_user3, lobby_question: lobby_question)}

    before do
      response1
      response2
      response3
      subject
    end

    it 'should add two points to the appropriate anon user' do
      expect(response1.reload.points).to eq 2
    end

    it 'should be equal to zero' do
      expect(response2.reload.points).to eq 0
    end

    it 'should be equal to zero' do
      expect(response3.reload.points).to eq 0
    end
  end

    context 'when all answers are correct' do
    let(:response1) { create(:response, created_at: Time.now + 5.seconds, answer: answer1, anon_user: anon_user1, lobby_question: lobby_question)}
    let(:response2) { create(:response, created_at: Time.now + 7.seconds, answer: answer1, anon_user: anon_user2, lobby_question: lobby_question)}
    let(:response3) { create(:response, created_at: Time.now + 9.seconds, answer: answer1, anon_user: anon_user3, lobby_question: lobby_question)}

    before do
      response1
      response2
      response3
      subject
    end

    it 'should add two points to response1 for being first' do
      expect(response1.reload.points).to eq 2
    end
    it 'should add one point to response2 for being second' do
      expect(response2.reload.points).to eq 1
    end
    it 'should add no points to response 3 for being last' do
      expect(response3.reload.points).to eq 0
    end
  end

  context 'when all answers are after time ends no points are added' do
    let(:response1) { create(:response, created_at: Time.now + 31.seconds, answer: answer1, anon_user: anon_user1, lobby_question: lobby_question)}
    let(:response2) { create(:response, created_at: Time.now + 32.seconds, answer: answer1, anon_user: anon_user2, lobby_question: lobby_question)}
    let(:response3) { create(:response, created_at: Time.now + 33.seconds, answer: answer1, anon_user: anon_user3, lobby_question: lobby_question)}

    before do
      response1
      response2
      response3
      subject
    end

    it 'should add 0 points to response1 for being after time ends' do
      expect(response1.reload.points).to eq 0
    end
    it 'should add 0 points to response2 for being after time ends' do
      expect(response2.reload.points).to eq 0
    end
    it 'should add 0 points to response2 for being after time ends' do
      expect(response3.reload.points).to eq 0
    end
  end

#   context 'when the first answer is taken in a quickfire round' do
#     let(:response1) { create(:response, created_at: Time.now + 15.seconds, answer: quickfireanswer1, anon_user: anon_user1, lobby_question: lobby_question2)}
#     let(:response2) { create(:response, created_at: Time.now + 36.seconds, answer: quickfireanswer1, anon_user: anon_user2, lobby_question: lobby_question2)}
#     let(:response3) { create(:response, created_at: Time.now + 37.seconds, answer: quickfireanswer1, anon_user: anon_user3, lobby_question: lobby_question2)}


# before do
#   response1
#   response2
#   response3
#   subject
# end

# it 'should add 15 points to the quickest response' do
#   expect(response1.reload.points).to eq 15
# end
# end
 end
