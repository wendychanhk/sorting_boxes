require 'spec_helper'

describe Sorting do
  describe "#compare" do
    context "find out what boxes users can get so that they won't get repeated contents" do
      before do 

      @boxes = 
        [{code: 'gr1', contents: ['1a', '1b']},
         {code: 'gr2', contents: ['1a', '2b']},
         {code: 'gr3', contents: ['1b', '2c']},
         {code: 'gr4', contents: ['2c', '3c']},
         {code: 'gr5', contents: ['3b', '1c']}]

        @sorted_boxes = Sorting.new(@boxes) 

      end 

      let(:users) do 
        [{ name: 'Steve', received_contents: ['1a', '1b', '3c'] },
         { name: 'Virginie', received_contents: ['3a', '2b', '3c'] },
         { name: 'Fiona', received_contents: ['1b', '2a', '3b'] },
         { name: 'Jenny', received_contents: ['3b', '2c', '1b'] },
         { name: 'James', received_contents: ['2b', '1b', '3a'] },
         { name: 'Fede', received_contents: ['2c', '3a', '1c'] },
         { name: 'Sara', received_contents: ['3a', '2c', '3b'] },
         { name: 'Tizi', received_contents: ['2b', '1b', '2a'] },
         { name: 'Thomas', received_contents: ['3c', '2b', '1a'] }]
      end 

      let(:expected_boxes) do 
        [{:name=>"Steve", :possible_boxes=>["gr5"]}, 
         {:name=>"Virginie", :possible_boxes=>["gr1", "gr3", "gr5"]}, 
         {:name=>"Fiona", :possible_boxes=>["gr2", "gr4"]}, 
         {:name=>"Jenny", :possible_boxes=>["gr2"]}, 
         {:name=>"James", :possible_boxes=>["gr4", "gr5"]}, 
         {:name=>"Fede", :possible_boxes=>["gr1", "gr2"]}, 
         {:name=>"Sara", :possible_boxes=>["gr1", "gr2"]}, 
         {:name=>"Tizi", :possible_boxes=>["gr4", "gr5"]}, 
         {:name=>"Thomas", :possible_boxes=>["gr3", "gr5"]}]
      end 
 
      it "return array of possible boxes to each user that have unique contents" do
        users_possible_boxes = []
        users.each do |user|
          users_possible_boxes << {name: user[:name], possible_boxes: @sorted_boxes.compare(user)}
        end
        expect(users_possible_boxes).to match_array(expected_boxes)
      end

      it "return an expected array of boxs when tested with an individual user" do
        test_user = {name: "ABC", received_contents: ['1a', '1b', '3c']}
        expected_result = {:name=>"ABC", :expected_boxes_testing=>["gr5"]}
        expect(@sorted_boxes.compare(test_user)).to match_array expected_result[:expected_boxes_testing]
      end 
    end 
  end 
end