class Post < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    post_date :date
    title :string , :required
    content :textile
    timestamps
  end

  belongs_to :author , :creator => true
  # --- Permissions --- #
  set_default_order "post_date DESC"

  def create_permitted?
     puts "create_permitted? #{acting_user.administrator?}"
    debugger #THIS IS THE LINE TO ADD TO INVOKE DEBUGGE

    acting_user.signed_up?
  end

  def update_permitted?
    acting_user.administrator? || self.author ==  acting_user.author
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
