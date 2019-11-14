class Subscriber < ApplicationRecord
  belongs_to :newsletter
  validates :fullname, presence: true
  validates :email, presence: true

  after_create :unsub_code_setter

  def unsub_code_setter
    code_base = 
      [69, 15, "g", 61, 23, "m", "r", 30, 27, 53, "x", 72, 9, 
        58, 86, 70, "b", 7, 49, 76, 84, 79, "K", 68, "J", "G", 
        99, 5, 52, 4, 80, 29, 36, 73, "s", "T", 87, 28, 90, "u", 
        51, 56, 93, 3, 81, 12, "p", 32, 22, 75, "Q", 39, 42, "N", 
        "a", "W", "H", 17, 50, "q", "f", 77, "I", "e", "A", 100, 
        54, 65, 48, 25, 24, 10, 57, "X", "C", "E", 21, 45, 11, 
        26, 85, 16, "o", 37, "P", 97, 13, 55, 91, "M", "z", 92, 
        62, "j", 47, "k", "d", 94, "w", 33, 64, 8, "n", 60, 2, 59, 
        "B", "V", "Z", 1, 35, 38, "S", "h", 82, "U", 34, 44, "i", 
        "F", 89, 78, 95, 40, 67, "l", 88, "c", 63, 98, 71, 31, 83, 
        "L", "y", "D", 18, 20, 19, 66, 41, 96, 43, "R", "Y", 6, 74, 
        "v", 14, "t", "O", 46]
      code = code_base.sample 6
      self.unsub_code = code
  end



end
