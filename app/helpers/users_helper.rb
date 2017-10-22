module UsersHelper
  def avatar_for(user)
    if user.avatar?
      image_tag user.avatar.url(:thumb), class: "img-thumbnail"
    end
  end
end
