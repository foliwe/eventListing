module LikesHelper
  def like_or_unlike(like, event)
    if like
     button_to 'Unlike',event_like_path(event , like),method: :delete
   else
     button_to 'Like',event_likes_path(event)
   end
 end
end
