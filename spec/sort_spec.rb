require 'spec_helper'

describe Sorting do
  describe "#compare" do
    context "find out what boxes users can get so that they won't get repeated contents" do
      let(:sort) { Sorting.new(users, boxes) }
      
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

      let(:boxes) do 
        [{code: 'gr1', contents: ['1a', '1b']},
         {code: 'gr2', contents: ['1a', '2b']},
         {code: 'gr3', contents: ['1b', '2c']},
         {code: 'gr4', contents: ['2c', '3c']},
         {code: 'gr5', contents: ['3b', '1c']}]
      end 

      let(:users_possible_boxes) do 
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
 
      it "find out what boxes users can get so that they won't get repeated contents" do
        expect(sort.compare).to match_array (users_possible_boxes)
      end
    end 
  end 
end