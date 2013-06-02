module ApplicationHelper
  def nav_link_to *args, &block
    options = args[block_given? ? 0 : 1] || {}
    content = link_to(*args, &block)
    li_class = current_page?(options) ? "active" : ""
    content_tag :li, content, class: li_class
  end

  def battlenet_link_to user
    link_to user.battlenet_id, "http://www.battle.net/d3/en/profile/#{user.battlenet_id.parameterize}/", target: :blank
  end

  def twitch_popup_link_to user
    link_to user.twitch_username, twitch_helper_path(user), data: {toggle: "modal", target: '#twitch_modal'}
  end

  def category_list_for user
    user.category_list.map do |category|
      category
    end.join(", ")
  end
end
