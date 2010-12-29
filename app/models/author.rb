class Author < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name :string , :required
    timestamps
  end
  
  #
  has_many :posts
  belongs_to :user
 #validate_uniqueness_of :name
  
  # --- Permissions --- #
  def create_permitted?
    acting_user.signed_up?
  end

  def update_permitted?
    acting_user.signed_up?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
