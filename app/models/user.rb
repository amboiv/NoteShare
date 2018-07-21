class User < ApplicationRecord
  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
  petergate(roles: [:admin, :instructor, :student], multiple: false)                        ##
  ############################################################################################ 
 

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name
  has_many :notes
  belongs_to :education_program, optional: true
  
  def first_name
    self.name.split.first
  end
  
  def last_name
    # .drop does not mutate array, it creates a new array containing all but the (1) first item(s) 
    # https://github.com/thoughtbot/til/blob/master/ruby/all-but-the-first-element-from-array.md
    # https://stackoverflow.com/questions/1333347/how-to-split-a-string-in-ruby-and-get-all-items-except-the-first-one
    name_array = self.name.split
    if name_array.size > 1
      name_array.drop(1).join(" ")
    else
      name_array.last
    end
    
  end

  
end
