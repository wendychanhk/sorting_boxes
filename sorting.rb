require 'pry'

class Sorting
  def initialize users, boxes 
    @users = users 
    @boxes = boxes 
  end 

  def compare 
    users_possible_boxes = []
    @users.each do |user| 
      possible_boxes = []
      @boxes.each do |box|
  	    if(box[:contents] - user[:received_contents]) == box[:contents] 
          possible_boxes << box[:code]
        end 
      end
      users_possible_boxes << {name: user[:name], possible_boxes: possible_boxes }
    end 
    users_possible_boxes
  end 
end 

# Here is a list of users and the contents they have received already.
users = [
  { name: 'Steve', received_contents: ['1a', '1b', '3c'] },
  { name: 'Virginie', received_contents: ['3a', '2b', '3c'] },
  { name: 'Fiona', received_contents: ['1b', '2a', '3b'] },
  { name: 'Jenny', received_contents: ['3b', '2c', '1b'] },
  { name: 'James', received_contents: ['2b', '1b', '3a'] },
  { name: 'Fede', received_contents: ['2c', '3a', '1c'] },
  { name: 'Sara', received_contents: ['3a', '2c', '3b'] },
  { name: 'Tizi', received_contents: ['2b', '1b', '2a'] },
  { name: 'Thomas', received_contents: ['3c', '2b', '1a'] },
]

# These are the boxes for the next shipment and their contents
boxes = [
  {code: 'gr1', contents: ['1a', '1b']},
  {code: 'gr2', contents: ['1a', '2b']},
  {code: 'gr3', contents: ['1b', '2c']},
  {code: 'gr4', contents: ['2c', '3c']},
  {code: 'gr5', contents: ['3b', '1c']},
]

sort = Sorting.new(users, boxes)

p sort.compare